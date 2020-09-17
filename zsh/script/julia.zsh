#

julia_base_opts=(prefix=/usr sysconfdir=/etc
                 USE_SYSTEM_LLVM=1
                 USE_SYSTEM_OPENLIBM=1
                 USE_SYSTEM_LIBUNWIND=1
                 USE_SYSTEM_PCRE=1
                 USE_SYSTEM_OPENSPECFUN=1
                 USE_SYSTEM_BLAS=1
                 USE_SYSTEM_LAPACK=1
                 USE_SYSTEM_FFTW=1
                 USE_SYSTEM_GMP=1
                 USE_SYSTEM_MPFR=1
                 USE_SYSTEM_ARPACK=1
                 USE_SYSTEM_SUITESPARSE=1
                 USE_SYSTEM_UTF8PROC=1
                 USE_SYSTEM_LIBGIT2=1
                 USE_SYSTEM_LIBSSH2=1
                 USE_SYSTEM_MBEDTLS=1
                 USE_SYSTEM_CURL=1
                 USE_SYSTEM_PATCHELF=1
                 USE_SYSTEM_ZLIB=1
                 USE_SYSTEM_P7ZIP=1
                 USE_SYSTEM_NGHTTP2=1
                 USE_LLVM_SHLIB=1
                 USE_BINARYBUILDER=0
                 LLVM_USE_CMAKE=0
                 LIBBLASNAME=libopenblas
                 LIBBLAS=-lopenblas
                 LIBLAPACKNAME=libopenblas
                 LIBLAPACK=-lopenblas
                 BUNDLE_DEBUG_LIBS=1)

arch=$(uname -m 2> /dev/null)

_jl_x86_target='generic,opt_size;haswell,clone_all,-rdrnd;skylake,base(1),-rdrnd,-rdseed,-rtm;cannonlake,base(1),-rdrnd,-rdseed,-rtm'
_jl_arm_target='armv7-a;armv7-a,neon;armv7-a,neon,vfp4'
_jl_aa64_target='generic;cortex-a57;thunderx2t99'

_jl_x86_single_target='native,-rdrnd,-rdseed,-rtm'
_jl_arm_single_target='native'
_jl_aa64_single_target='native'

case "$arch" in
  x86_64|x86-64)
    julia_opts=("${julia_base_opts[@]}" MARCH=x86-64 JULIA_CPU_TARGET="${_jl_x86_target}")
    julia_single_opts=("${julia_base_opts[@]}" MARCH=x86-64
                       JULIA_CPU_TARGET="${_jl_x86_single_target}")
    ;;
  i?86)
    julia_opts=("${julia_base_opts[@]}" MARCH=pentium4 JULIA_CPU_TARGET="${_jl_x86_target}")
    julia_single_opts=("${julia_base_opts[@]}" MARCH=pentium4
                       JULIA_CPU_TARGET="${_jl_x86_single_target}")
    ;;
  aarch64)
    julia_opts=("${julia_base_opts[@]}" MARCH=armv8-a JULIA_CPU_TARGET="${_jl_aa64_target}")
    julia_single_opts=("${julia_base_opts[@]}" MARCH=armv8-a
                       JULIA_CPU_TARGET="${_jl_aa64_single_target}")
    ;;
  armv7l|armv8l)
    julia_opts=("${julia_base_opts[@]}" MARCH=armv7-a JULIA_CPU_TARGET="${_jl_arm_target}")
    julia_single_opts=("${julia_base_opts[@]}" MARCH=armv7-a
                       JULIA_CPU_TARGET="${_jl_arm_single_target}")
    ;;
esac
