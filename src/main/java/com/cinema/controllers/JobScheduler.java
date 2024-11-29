package com.cinema.controllers;

import com.cinema.services.ISeatStatusService;
import com.cinema.services.impl.SeatStatusServiceImpl;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;


@WebListener
public class JobScheduler implements ServletContextListener {

    private ScheduledExecutorService scheduler;
    ISeatStatusService seatStatusService = new SeatStatusServiceImpl();
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newScheduledThreadPool(1);

        // Lên lịch chạy job mỗi 5 phút
        scheduler.scheduleAtFixedRate(() -> {
            seatStatusService.resetExpiredSeats();
        }, 0, 3, TimeUnit.MINUTES);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
    }
}
