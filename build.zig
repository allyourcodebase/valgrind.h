const std = @import("std");

pub fn build(b: *std.Build) void {
    //const target = b.standardTargetOptions(.{});

    const config_header = b.addConfigHeader(.{
        .style = .{ .cmake = b.path("include/valgrind.h.in") },
        .include_path = "valgrind/valgrind.h",
    }, .{});

    const install_file = b.addInstallFileWithDir(config_header.getOutput(), .header, "valgrind/valgrind.h");
    b.getInstallStep().dependOn(&install_file.step);
}
