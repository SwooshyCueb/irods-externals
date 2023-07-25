all : avro avro-libstdcxx aws-sdk-cpp aws-sdk-cpp-libstdcxx boost boost-libstdcxx catch2 clang clang-runtime cmake cppzmq cppzmq-libstdcxx fmt fmt-libstdcxx json jwt-cpp libarchive libs3 mungefs nanodbc nanodbc-libstdcxx qpid-proton qpid-proton-libstdcxx redis spdlog spdlog-libstdcxx zeromq4-1 zeromq4-1-libstdcxx


server-libcxx : avro boost catch2 clang-runtime cppzmq fmt json libarchive nanodbc spdlog zeromq4-1

server-libstdcxx : avro-libstdcxx boost-libstdcxx catch2 fmt-libstdcxx json libarchive nanodbc-libstdcxx spdlog-libstdcxx zeromq4-1-libstdcxx

server : server-libcxx server-libstdcxx

.PHONY : all server-libcxx server-libstdcxx server clean $(all)

BUILD_OPTIONS=-v

packages.mk : Makefile versions.json build.py
	./build.py packagesfile

-include packages.mk

$(all) : packages.mk

$(AVRO_PACKAGE) : $(BOOST_PACKAGE) $(CMAKE_PACKAGE) $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) avro > avro.log 2>&1
$(AVRO-LIBSTDCXX_PACKAGE) : $(BOOST-LIBSTDCXX_PACKAGE) $(CMAKE_PACKAGE) $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) avro-libstdcxx > avro-libstdcxx.log 2>&1
avro-libcxx : $(AVRO_PACKAGE)
avro-libstdcxx : $(AVRO-LIBSTDCXX_PACKAGE)
avro : avro-libcxx avro-libstdcxx
avro_clean :
	@echo "Cleaning avro..."
	@rm -rf avro*
	@rm -rf $(AVRO_PACKAGE) $(AVRO-LIBSTDCXX_PACKAGE)

$(AWS-SDK-CPP_PACKAGE) : $(CMAKE_PACKAGE) $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) aws-sdk-cpp > aws-sdk-cpp.log 2>&1
aws-sdk-cpp : $(AWS-SDK-CPP_PACKAGE)
$(AWS-SDK-CPP-LIBSTDCXX_PACKAGE) : $(CMAKE_PACKAGE) $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) aws-sdk-cpp-libstdcxx > aws-sdk-cpp-libstdcxx.log 2>&1
aws-sdk-cpp-libstdcxx : $(AWS-SDK-CPP-LIBSTDCXX_PACKAGE)
aws-sdk-cpp_clean :
	@echo "Cleaning aws-sdk-cpp..."
	@rm -rf aws-sdk-cpp*
	@rm -rf $(AWS-SDK-CPP_PACKAGE) $(AWS-SDK-CPP-LIBSTDCXX_PACKAGE)

$(BOOST_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) boost > boost.log 2>&1
boost : $(BOOST_PACKAGE)
$(BOOST-LIBSTDCXX_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) boost-libstdcxx > boost-libstdcxx.log 2>&1
boost-libstdcxx : $(BOOST-LIBSTDCXX_PACKAGE)
boost_clean :
	@echo "Cleaning boost..."
	@rm -rf boost*
	@rm -rf $(BOOST_PACKAGE) $(BOOST-LIBSTDCXX_PACKAGE)

$(CATCH2_PACKAGE) : $(CMAKE_PACKAGE)
	./build.py $(BUILD_OPTIONS) catch2 > catch2.log 2>&1
catch2 : $(CATCH2_PACKAGE)
catch2_clean :
	@echo "Cleaning catch2..."
	@rm -rf catch2*
	@rm -rf $(CATCH2_PACKAGE)

$(CLANG_PACKAGE) : $(CMAKE_PACKAGE)
	./build.py $(BUILD_OPTIONS) clang > clang.log 2>&1
clang : $(CLANG_PACKAGE)
clang_clean :
	@echo "Cleaning clang..."
	@rm -rf clang*
	@rm -rf $(CLANG_PACKAGE)

$(CLANG-RUNTIME_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) clang-runtime > clang-runtime.log 2>&1
clang-runtime : $(CLANG-RUNTIME_PACKAGE)
clang-runtime_clean :
	@echo "Cleaning clang-runtime..."
	@rm -rf clang-runtime*
	@rm -rf $(CLANG-RUNTIME_PACKAGE)

$(CMAKE_PACKAGE) :
	./build.py $(BUILD_OPTIONS) cmake > cmake.log 2>&1
cmake : $(CMAKE_PACKAGE)
cmake_clean :
	@echo "Cleaning cmake..."
	@rm -rf cmake*
	@rm -rf $(CMAKE_PACKAGE)

$(CPPZMQ_PACKAGE) : $(ZEROMQ4-1_PACKAGE)
	./build.py $(BUILD_OPTIONS) cppzmq > cppzmq.log 2>&1
cppzmq : $(CPPZMQ_PACKAGE)
$(CPPZMQ-LIBSTDCXX_PACKAGE) : $(ZEROMQ4-1-LIBSTDCXX_PACKAGE)
	./build.py $(BUILD_OPTIONS) cppzmq-libstdcxx > cppzmq-libstdcxx.log 2>&1
cppzmq-libstdcxx : $(CPPZMQ-LIBSTDCXX_PACKAGE)
cppzmq_clean :
	@echo "Cleaning cppzmq..."
	@rm -rf cppzmq*
	@rm -rf $(CPPZMQ_PACKAGE) $(CPPZMQ-LIBSTDCXX_PACKAGE)

$(FMT_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) fmt > fmt.log 2>&1
fmt : $(FMT_PACKAGE)
$(FMT-LIBSTDCXX_PACKAGE) : $(CLANG_P*/6*/0ACKAGE)
	./build.py $(BUILD_OPTIONS) fmt-libstdcxx > fmt-libstdcxx.log 2>&1
fmt-libstdcxx : $(FMT-LIBSTDCXX_PACKAGE)
fmt_clean :
	@echo "Cleaning fmt..."
	@rm -rf fmt*
	@rm -rf $(FMT_PACKAGE) $(FMT-LIBSTDCXX_PACKAGE)

$(JSON_PACKAGE) : $(CMAKE_PACKAGE)
	./build.py $(BUILD_OPTIONS) json > json.log 2>&1
json : $(JSON_PACKAGE)
json_clean :
	@echo "Cleaning json..."
	@rm -rf json*
	@rm -rf $(JSON_PACKAGE)

$(JWT-CPP_PACKAGE) : $(CMAKE_PACKAGE) $(JSON_PACKAGE)
	./build.py $(BUILD_OPTIONS) jwt-cpp > jwt-cpp.log 2>&1
jwt-cpp : $(JWT-CPP_PACKAGE)
jwt-cpp_clean :
	@echo "Cleaning jwt-cpp..."
	@rm -rf jwt-cpp*
	@rm -rf $(JWT-CPP_PACKAGE)

$(LIBARCHIVE_PACKAGE) : $(CMAKE_PACKAGE) $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) libarchive > libarchive.log 2>&1
libarchive : $(LIBARCHIVE_PACKAGE)
libarchive_clean :
	@echo "Cleaning libarchive..."
	@rm -rf libarchive*
	@rm -rf $(LIBARCHIVE_PACKAGE)

$(LIBS3_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) libs3 > libs3.log 2>&1
libs3 : $(LIBS3_PACKAGE)
libs3_clean :
	@echo "Cleaning libs3..."
	@rm -rf libs3*
	@rm -rf $(LIBS3_PACKAGE)

$(MUNGEFS_PACKAGE) : $(CPPZMQ-LIBSTDCXX_PACKAGE) $(LIBARCHIVE_PACKAGE) $(AVRO-LIBSTDCXX_PACKAGE) $(ZEROMQ4-1-LIBSTDCXX_PACKAGE)
	./build.py $(BUILD_OPTIONS) mungefs > mungefs.log 2>&1
mungefs : $(MUNGEFS_PACKAGE)
mungefs_clean :
	@echo "Cleaning mungefs..."
	@rm -rf mungefs*
	@rm -rf $(MUNGEFS_PACKAGE)

$(NANODBC_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) nanodbc > nanodbc.log 2>&1
nanodbc : $(NANODBC_PACKAGE)
$(NANODBC-LIBSTDCXX_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) nanodbc-libstdcxx > nanodbc-libstdcxx.log 2>&1
nanodbc-libstdcxx : $(NANODBC-LIBSTDCXX_PACKAGE)
nanodbc_clean :
	@echo "Cleaning nanodbc..."
	@rm -rf nanodbc*
	@rm -rf $(NANODBC_PACKAGE) $(NANODBC-LIBSTDCXX_PACKAGE)

$(QPID-PROTON_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) qpid-proton > qpid-proton.log 2>&1
qpid-proton : $(QPID-PROTON_PACKAGE)
$(QPID-PROTON-LIBSTDCXX_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) qpid-proton-libstdcxx > qpid-proton-libstdcxx.log 2>&1
qpid-proton-libstdcxx : $(QPID-PROTON-LIBSTDCXX_PACKAGE)
qpid-proton_clean :
	@echo "Cleaning qpid-proton..."
	@rm -rf qpid-proton*
	@rm -rf $(QPID-PROTON_PACKAGE) $(QPID-PROTON-LIBSTDCXX_PACKAGE)

$(REDIS_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) redis > redis.log 2>&1
redis : $(REDIS_PACKAGE)
redis_clean :
	@echo "Cleaning redis..."
	@rm -rf redis*
	@rm -rf $(REDIS_PACKAGE)

$(SPDLOG_PACKAGE) : $(FMT_PACKAGE)
	./build.py $(BUILD_OPTIONS) spdlog > spdlog.log 2>&1
spdlog : $(SPDLOG_PACKAGE)
$(SPDLOG-LIBSTDCXX_PACKAGE) : $(FMT-LIBSTDCXX_PACKAGE)
	./build.py $(BUILD_OPTIONS) spdlog-libstdcxx > spdlog-libstdcxx.log 2>&1
spdlog-libstdcxx : $(SPDLOG-LIBSTDCXX_PACKAGE)
spdlog_clean :
	@echo "Cleaning spdlog..."
	@rm -rf spdlog*
	@rm -rf $(SPDLOG_PACKAGE) $(SPDLOG-LIBSTDCXX_PACKAGE)

$(ZEROMQ4-1_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) zeromq4-1 > zeromq4-1.log 2>&1
zeromq4-1 : $(ZEROMQ4-1_PACKAGE)
$(ZEROMQ4-1-LIBSTDCXX_PACKAGE) : $(CLANG_PACKAGE)
	./build.py $(BUILD_OPTIONS) zeromq4-1-libstdcxx > zeromq4-1-libstdcxx.log 2>&1
zeromq4-1-libstdcxx : $(ZEROMQ4-1-LIBSTDCXX_PACKAGE)
zeromq4-1_clean :
	@echo "Cleaning zeromq4-1..."
	@rm -rf zeromq4-1*
	@rm -rf $(ZEROMQ4-1_PACKAGE) $(ZEROMQ4-1-LIBSTDCXX_PACKAGE)

clean : avro_clean aws-sdk-cpp_clean boost_clean catch2_clean clang_clean clang-runtime_clean cmake_clean cppzmq_clean fmt_clean json_clean jwt-cpp_clean libarchive_clean libs3_clean mungefs_clean nanodbc_clean qpid-proton_clean redis_clean spdlog_clean zeromq4-1_clean
	@echo "Cleaning generated files..."
	@rm -rf packages.mk
	@echo "Done."
