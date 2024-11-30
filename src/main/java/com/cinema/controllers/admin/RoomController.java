package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.List;
import com.cinema.entity.Cinema;
import com.cinema.entity.Person;
import com.cinema.entity.Room;
import com.cinema.entity.Seat;
import com.cinema.services.*;
import com.cinema.services.impl.*;
import com.cinema.services.ICinemaService;
import com.cinema.services.impl.CinemaServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/admin/rooms", "/admin/addRoom", "/admin/editRoom" , "/admin/deleteRoom" , "/admin/searchRoom"})
public class RoomController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	ICinemaService cinemaService = new CinemaServiceImpl();
	
	
	ISeatService seatService = new SeatServiceImpl();
	
private IRoomService roomService;
@Override
public void init() throws ServletException {
    super.init();
    roomService = new RoomServiceImpl(); // Implementation class for RoomService
}


@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    resp.setCharacterEncoding("UTF-8");
    HttpSession session = req.getSession(false);

    if (session != null && session.getAttribute("person") != null) {
        Person person = (Person) session.getAttribute("person");

        if (person.getRole().toLowerCase().contains("admin")) {
            String action = req.getServletPath();
            switch (action) {
                case "/admin/rooms":
                    showRoomsByCinema(req, resp);
                    break;
                case "/admin/editRoom":
                    showEditRoom(req, resp);
                    break;
                case "/admin/deleteRoom":
                    deleteRoom(req, resp);
                    break;
                case "/admin/searchRoom":
                    searchRooms(req, resp);
                    break;
//        case "/admin/rooms":
//        default:
//            listAllRooms(req, resp);
//            break;
            }
            return;
        }
    }
    resp.sendRedirect(req.getContextPath() + "/signin");
}

protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action = req.getServletPath();
    switch (action) {
        case "/admin/addRoom":
            addRoom(req, resp);
            break;
        case "/admin/editRoom":
            editRoom(req, resp);
            break;
        case "/admin/deleteRoom":
            deleteRoom(req, resp); // Thêm dòng này để xử lý xóa bằng POST
            break;
    }
}

private void showRoomsByCinema(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String cinemaIdParam = req.getParameter("id");
    if (cinemaIdParam != null && !cinemaIdParam.isEmpty()) {
        try {
            int cinemaId = Integer.parseInt(cinemaIdParam);
            List<Room> rooms = roomService.getRoomsByCinemaId(cinemaId); // Fetch rooms by cinemaId
            Cinema cinema = cinemaService.getCinemaById(cinemaId);
            req.setAttribute("rooms", rooms);
            req.setAttribute("cinemaName", cinema.getCinemaName());
            req.setAttribute("cinemaId", cinemaId);
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Room.jsp");
            rd.forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidid");
        }
    } else {
        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidid");
    }
}

public void showEditRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String roomIDParam = req.getParameter("roomId");
	 String cinemaIDParam = req.getParameter("cinemaId");
     if (roomIDParam != null && !roomIDParam.isEmpty()) {
         try {
             int roomID = Integer.parseInt(roomIDParam);
             int cinemaID = Integer.parseInt(cinemaIDParam);
             Cinema cinema = cinemaService.getCinemaById(cinemaID);
             Room room = roomService.getRoomById(roomID);
             if (room != null) {
                 req.setAttribute("room", room);
                 req.setAttribute("cinemaId", cinemaID);
                 req.setAttribute("cinemaName", cinema.getCinemaName());
                 RequestDispatcher rd = req.getRequestDispatcher("/views/admin/EditRoom.jsp");
                 rd.forward(req, resp);
             } else {
                 resp.sendRedirect(req.getContextPath() + "/admin/addRoom?error=notfound");
             }
         } catch (NumberFormatException e) {
             resp.sendRedirect(req.getContextPath() + "/admin/addRoom?error=invalidid");
         }
     } else {
         resp.sendRedirect(req.getContextPath() + "/admin/addRoom?error=invalidid");
     }
}

private void editRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    // Lấy roomId và cinemaId từ URL
    String roomIDParam = req.getParameter("roomId");
    String cinemaIDParam = req.getParameter("cinemaId");

    System.out.println("Room ID Param: " + roomIDParam);
    System.out.println("Cinema ID Param: " + cinemaIDParam);

    if (roomIDParam != null && !roomIDParam.isEmpty() && cinemaIDParam != null && !cinemaIDParam.isEmpty()) {
        try {
            int roomID = Integer.parseInt(roomIDParam);
            int cinemaID = Integer.parseInt(cinemaIDParam);

            // Lấy các giá trị từ form
            String roomName = req.getParameter("room_name");
            String screenType = req.getParameter("room_type");
            int chairNumber = Integer.parseInt(req.getParameter("seating_capacity"));
            boolean status = Boolean.parseBoolean(req.getParameter("status"));

            // Tạo đối tượng Room
            Room room = new Room();
            room.setRoomID(roomID);
            room.setRoomName(roomName);
            room.setScreenType(screenType);
            room.setChairNumber(chairNumber);
            room.setStatus(status);

            // Lấy thông tin Cinema từ service
            Cinema cinema = cinemaService.getCinemaById(cinemaID);
            System.out.println("Cinema Object: " + cinema);

            if (cinema != null) {
                room.setCinema(cinema);

                // Gọi service để cập nhật Room
                boolean isUpdated = roomService.updateRoom(room);
                System.out.println("Update Room Status: " + isUpdated);

                if (isUpdated) {
                    resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/admin/editRoom?roomId=" + roomID + "&cinemaId=" + cinemaID + "&error=true");
                }
            } else {
                System.err.println("Cinema not found for ID: " + cinemaID);
                resp.sendRedirect(req.getContextPath() + "/admin/editRoom?roomId=" + roomID + "&cinemaId=" + cinemaID + "&error=cinemanotfound");
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid ID Format: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/editRoom?roomId=" + roomIDParam + "&cinemaId=" + cinemaIDParam + "&error=invalidinput");
        }
    } else {
        System.err.println("Room ID or Cinema ID is null or empty");
        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidid");
    }
}


//private void addRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//    try {
//        // Lấy giá trị từ request
//        String cinemaIdParam = req.getParameter("cinemaId");
//        String roomName = req.getParameter("room_name");
//        String screenType = req.getParameter("room_type");
//        String capacityParam = req.getParameter("capacity");
//        String statusParam = req.getParameter("status");
//
//        // Kiểm tra các tham số có null không
//        if (cinemaIdParam == null || capacityParam == null || statusParam == null || roomName == null || screenType == null) {
//            resp.sendRedirect(req.getContextPath() + "/admin/addRoom?error=missingParams");
//            return;
//        }
//
//        // Chuyển đổi các giá trị
//        int cinemaID = Integer.parseInt(cinemaIdParam);
//        int numRooms = Integer.parseInt(capacityParam);
//        boolean status = Boolean.parseBoolean(statusParam);
//
//        // Tạo đối tượng Room
//        Room room = new Room();
//        room.setRoomName(roomName);
//        room.setScreenType(screenType);
//        room.setChairNumber(numRooms);
//        room.setStatus(status);
//
//        // Gọi service để thêm Room
//        boolean isAdded = roomService.addRoom(room, cinemaID);
//
//        // Điều hướng theo kết quả
//        if (isAdded) {
//            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID );
//        } else {
//            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID );
//        }
//    } catch (NumberFormatException e) {
//        // Xử lý nếu tham số không hợp lệ
//        System.err.println("Invalid input: " + e.getMessage());
//        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidInput");
//    } catch (Exception e) {
//        // Xử lý lỗi khác
//        System.err.println("Error adding room: " + e.getMessage());
//        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=unexpected");
//    }
//}



//private void addRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//    try {
//        // Lấy giá trị từ request
//        String cinemaIdParam = req.getParameter("cinemaId");
//        String roomName = req.getParameter("room_name");
//        String screenType = req.getParameter("room_type");
//        String capacityParam = req.getParameter("capacity");
//        String statusParam = req.getParameter("status");
//
//        // Kiểm tra các tham số có null không
//        if (cinemaIdParam == null || capacityParam == null || statusParam == null || roomName == null || screenType == null) {
//            resp.sendRedirect(req.getContextPath() + "/admin/addRoom?error=missingParams");
//            return;
//        }
//
//        // Chuyển đổi các giá trị
//        int cinemaID = Integer.parseInt(cinemaIdParam);
//        int chairNumber = Integer.parseInt(capacityParam);
//        boolean status = Boolean.parseBoolean(statusParam);
//
//        // Tạo đối tượng Room
//        Room room = new Room();
//        room.setRoomName(roomName);
//        room.setScreenType(screenType);
//        room.setChairNumber(chairNumber);
//        room.setStatus(status);
//
//        // Gọi service để thêm Room
//        boolean isAdded = roomService.addRoom(room, cinemaID);
//
//        if (isAdded) {
//            // Sau khi thêm phòng thành công, thêm số ghế tương ứng
//            Room addedRoom = roomService.getRoomByNameAndCinemaId(roomName, cinemaID); // Hàm này để lấy thông tin phòng vừa được thêm
//
//            if (addedRoom != null) {
//                int seatsPerRow = 14; // Số ghế cố định trên mỗi hàng
//                char currentRow = 'A';
//                int seatCounter = 0;
//
//                while (seatCounter < chairNumber) {
//                    for (int j = 1; j <= seatsPerRow && seatCounter < chairNumber; j++) {
//                        // Tạo ghế mới
//                        Chair chair = new Chair();
//                        chair.setChairName(currentRow + String.valueOf(j)); // Đặt tên ghế, ví dụ: A1, A2,...
//                        chair.setStatus(true); // Có thể điều chỉnh trạng thái ghế theo yêu cầu của bạn
//                        chair.setRoom(addedRoom); // Liên kết ghế với phòng vừa được tạo
//
//                        // Gọi service để thêm ghế
//                        chairService.addChair(chair);
//                        seatCounter++;
//                    }
//                    currentRow++; // Chuyển sang hàng tiếp theo (B, C,...)
//                }
//            }
//
//            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID);
//        } else {
//            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID);
//        }
//    } catch (NumberFormatException e) {
//        // Xử lý nếu tham số không hợp lệ
//        System.err.println("Invalid input: " + e.getMessage());
//        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidInput");
//    } catch (Exception e) {
//        // Xử lý lỗi khác
//        System.err.println("Error adding room: " + e.getMessage());
//        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=unexpected");
//    }
//}

 // hàm update thêm bản mới nhất của Huy

//private void addRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//    try {
//        // Lấy giá trị từ request
//        String cinemaIdParam = req.getParameter("cinemaId");
//        String roomName = req.getParameter("room_name");
//        String screenType = req.getParameter("room_type");
//        String statusParam = req.getParameter("status");
//
//        // Kiểm tra các tham số có null không
//        if (cinemaIdParam == null || statusParam == null || roomName == null || screenType == null) {
//            resp.sendRedirect(req.getContextPath() + "/admin/addRoom?error=missingParams");
//            return;
//        }
//
//        // Chuyển đổi các giá trị
//        int cinemaID = Integer.parseInt(cinemaIdParam);
//        int chairNumber = 70; // Mặc định số ghế là 70
//        boolean status = Boolean.parseBoolean(statusParam);
//
//        // Tạo đối tượng Room
//        Room room = new Room();
//        room.setRoomName(roomName);
//        room.setScreenType(screenType);
//        room.setChairNumber(chairNumber);
//        room.setStatus(status);
//
//        // Gọi service để thêm Room
//        boolean isAdded = roomService.addRoom(room, cinemaID); // Sử dụng hàm addRoom phù hợp với cấu trúc dữ liệu
//
//        if (isAdded) {
//            // Sau khi thêm phòng thành công, thêm 70 ghế tương ứng
//            Room addedRoom = roomService.getRoomByNameAndCinemaId(roomName, cinemaID); // Hàm này để lấy thông tin phòng vừa được thêm
//
//            if (addedRoom != null) {
//                char[] rows = {'A', 'B', 'C', 'D', 'E'}; // 5 hàng: A, B, C, D, E
//                int seatsPerRow = 14; // 14 ghế mỗi hàng
//
//                for (char row : rows) {
//                    for (int i = 1; i <= seatsPerRow; i++) {
//                        // Tạo ghế mới
//                        Seat seat = new Seat();
//                        seat.setSeatNumber(row + String.valueOf(i)); // Đặt tên ghế, ví dụ: A1, A2, B1, B2,...
//                        seat.setRoom(addedRoom); // Liên kết ghế với phòng vừa được tạo
//
//                        // Hàng D và E có thuộc tính isCouple = true
//                        if (row == 'D' || row == 'E') {
//                            seat.setCouple(true);
//                        } else {
//                            seat.setCouple(false);
//                        }
//
//                        // Gọi service để thêm ghế
//                        seatService.addSeat(seat);
//                    }
//                }
//            }
//
//            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID + "&success=added");
//        } else {
//            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID + "&error=addfailed");
//        }
//    } catch (NumberFormatException e) {
//        // Xử lý nếu tham số không hợp lệ
//        System.err.println("Invalid input: " + e.getMessage());
//        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidInput");
//    } catch (Exception e) {
//        // Xử lý lỗi khác
//        System.err.println("Error adding room: " + e.getMessage());
//        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=unexpected");
//    }
//}


private void addRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    try {
        // Lấy giá trị từ request
        String cinemaIdParam = req.getParameter("cinemaId");
        String roomName = req.getParameter("room_name");
        String screenType = req.getParameter("room_type");
        String capacityParam = req.getParameter("capacity");
        String statusParam = req.getParameter("status");

        // Kiểm tra các tham số có null không
        if (cinemaIdParam == null || capacityParam == null || statusParam == null || roomName == null || screenType == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/addRoom?error=missingParams");
            return;
        }

        // Chuyển đổi các giá trị
        int cinemaID = Integer.parseInt(cinemaIdParam);
        int chairNumber = Integer.parseInt(capacityParam);
        boolean status = Boolean.parseBoolean(statusParam);

        // Tạo đối tượng Room
        Room room = new Room();
        room.setRoomName(roomName);
        room.setScreenType(screenType);
        room.setChairNumber(chairNumber);
        room.setStatus(status);

        // Gọi service để thêm Room
        boolean isAdded = roomService.addRoom(room, cinemaID);

        if (isAdded) {
            // Sau khi thêm phòng thành công, thêm số ghế tương ứng vào bảng Seat
            Room addedRoom = roomService.getRoomByNameAndCinemaId(roomName, cinemaID); // Hàm này để lấy thông tin phòng vừa được thêm

            if (addedRoom != null) {
                char[] rows = {'A', 'B', 'C', 'D', 'E'}; // Các hàng: A, B, C, D, E
                int seatsPerRow = 14; // 14 ghế mỗi hàng
                int seatCounter = 0;

                for (char row : rows) {
                    for (int i = 1; i <= seatsPerRow && seatCounter < chairNumber; i++) {
                        // Tạo ghế mới
                        Seat seat = new Seat();
                        seat.setSeatNumber(row + String.valueOf(i)); // Đặt tên ghế, ví dụ: A1, A2, B1, B2, ...
                        seat.setRoom(addedRoom); // Liên kết ghế với phòng vừa được tạo

                        // Hàng D và E có thuộc tính isCouple = true
                        if (row == 'D' || row == 'E') {
                            seat.setCouple(true);
                        //	seat.setIsCouple(1);
                        } else {
                            seat.setCouple(false);
                        //	seat.setIsCouple(0);
                        }

                        // Gọi service để thêm ghế
                        seatService.addSeat(seat);
                        seatCounter++;
                    }
                }
            }

            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID + "&success=added");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID + "&error=addfailed");
        }
    } catch (NumberFormatException e) {
        // Xử lý nếu tham số không hợp lệ
        System.err.println("Invalid input: " + e.getMessage());
        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidInput");
    } catch (Exception e) {
        // Xử lý lỗi khác
        System.err.println("Error adding room: " + e.getMessage());
        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=unexpected");
    }
}



private void deleteRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String roomIDParam = req.getParameter("id");
    String cinemaIDParam = req.getParameter("cinemaId");  // Lấy cinemaId từ request

    if (roomIDParam != null && !roomIDParam.isEmpty()) {
        try {
            int roomID = Integer.parseInt(roomIDParam);
            boolean isDeleted = roomService.deleteRoomById(roomID);
            if (isDeleted) {
                // Kiểm tra cinemaId và chuyển hướng về đúng danh sách phòng của rạp
                if (cinemaIDParam != null && !cinemaIDParam.isEmpty()) {
                    int cinemaID = Integer.parseInt(cinemaIDParam);
                    resp.sendRedirect(req.getContextPath() + "/admin/rooms?id=" + cinemaID + "&success=deleted");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=missingcinemaid");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=notdeleted");
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid Room ID Format: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=invalidid");
        }
    } else {
        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=missingid");
    }
}



private void searchRooms(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String screenType = req.getParameter("screenType");
    String cinemaIdParam = req.getParameter("cinemaId");

    if (cinemaIdParam == null || cinemaIdParam.isEmpty()) {
        resp.sendRedirect(req.getContextPath() + "/admin/rooms?error=missingCinemaId");
        return;
    }

    int cinemaId = Integer.parseInt(cinemaIdParam);
    
    Cinema cinema = cinemaService.getCinemaById(cinemaId);

    // Tìm kiếm các phòng thuộc một rạp cụ thể với kiểu màn hình
    List<Room> rooms;

    if (screenType == null || screenType.equals("All")) {
        // Nếu không chọn kiểu màn hình, tìm kiếm tất cả phòng của rạp cụ thể
        rooms = roomService.getRoomsByCinemaId(cinemaId);
    } else {
        // Tìm kiếm các phòng của rạp cụ thể với loại màn hình được chỉ định
        rooms = roomService.searchRoomsByScreenTypeAndCinemaId(screenType, cinemaId);
    }

    // Đặt các thuộc tính vào request để truyền đến JSP
    req.setAttribute("rooms", rooms);
    req.setAttribute("cinemaName", cinema.getCinemaName());
    req.setAttribute("cinemaId", cinemaId);
    req.setAttribute("screenType", screenType);  // Để giữ lại lựa chọn sau khi tìm kiếm

    // Chuyển tiếp đến trang Room.jsp
    RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Room.jsp");
    rd.forward(req, resp);
}










}
