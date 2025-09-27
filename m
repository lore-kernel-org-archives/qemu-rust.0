Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCCFCAC5B8
	for <qemu-rust@archiver.kernel.org>; Sat, 27 Sep 2025 17:18:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v2YZ1-0007fA-2G; Sat, 27 Sep 2025 13:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2YYz-0007eb-2W
 for qemu-rust@nongnu.org; Sat, 27 Sep 2025 13:18:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2YYo-0005F5-8K
 for qemu-rust@nongnu.org; Sat, 27 Sep 2025 13:18:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so2280482f8f.0
 for <qemu-rust@nongnu.org>; Sat, 27 Sep 2025 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758993477; x=1759598277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bU5leybSLoHUS/zdIYbIIt7mWgcZedcjGKuWRErQKEA=;
 b=kOc+YbFXCERThkYj8CKnP/jfvMjvYbi2KUaSjPG0lNaBPXTpp9QEv9Y1xXhk0NieF6
 iT8TeoBuJCpFOfQ2MPwQJvqh8CTOouuObbz1r7iNuR+CJuoIYbR0vTxgCF6fGLPrJ3ay
 Wt4J5KieoDUqLOX6sAOWz2T0QVUEPKJuc5ERqf/G5QXsOVXjNBEcMfgMz3SLwiuyAqok
 +mH4kyepMeLyzlt4GeLxjBTocqTNwhTNqW2IoH1v4VzGt2S51EmxkfNJYlYVQY+7UkI6
 Wbgv0vu2tvX1GWD546iGbwR/OFrz6r6HJcF+ch3o/rACvFQ5z4dcGrIknSjDm73RlF8P
 6eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758993477; x=1759598277;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bU5leybSLoHUS/zdIYbIIt7mWgcZedcjGKuWRErQKEA=;
 b=HdsIgFHZ4B0RdSaokef6lUL0JIyr4YW/je7uQCxvqhV1zxBaGC/L0IopJctZ0Kz+5U
 1JGOGNriFDsZ5ffOhRj5RhPVp3zPHXrWpWW370C77Mma6b1xdqki25OxGhEnQylkhbAk
 6rEbph5o46MZRiY1pPMlgKnDbouC5DZmss7D8nazNM+6+Fgkm4wr0b1qUv7+4bfA72k8
 clZPT25FiDfsNErHJw9uZOvDdwCgr2z5lRpkkHWFS2i4V6v37Ck1liD9o7nf4uSQvEBI
 hVvFM/7SYkymZb4ZI4hgZsebp+P/Zy/P+tamuvqd8Crf3MmtuH//PBpzsuCj0WTRq9WG
 tfvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCEnWlMqXq4F8bVS740ilOJpGMp+PFOtG42jnfcohEbuG11+dZDu3pIn5J7CPG07vHcx1IitTyi84=@nongnu.org
X-Gm-Message-State: AOJu0YydmHmJWBDOxhzUgz/ts8Ma5npyrY/mFLuKpUuTRzXBI356g7xu
 K2k+eEXb482m56vQSx6Y4o/3/hhI830wQbDptPccsmhVkEv8AeJvS9PuQWb49qw5BIc=
X-Gm-Gg: ASbGnctpB+HJwBhTSnNAHTRaVWFyL7UWioS0w3QD2JKTBNWichKQLt8Nf9mmNxCX6rl
 5wx4r1p/I/Qyi0JApHCFfILBmT7JBUzp8vPGmUFdaX7ofsDWYOp/WB0g6ITcmRG3+bRSH9nd5MW
 sVc4f05Pf/Cw+DyQ4jbsIFOfYZrffM8484UdR7Mzf3OmpdpVMjWTXcb1+1r61kXREqJU4y3dg3M
 EoK1Yu5nUlwkJHQxHmAHnBIeN8SpiavBBgMEzgGQqK/cxU95J287Jdy13p8yCdDw9laeohIQaqu
 3Uk5oyFlMdPFcA2xw2Ry7jcAy7xyrFaRWY3lfZYf3XqC+go/FQR4WsPM2qRCIVyjpl6SopcGeEw
 9shG43ymcpI/FaMr6+HKMKe2cJSXmmVdFIQ==
X-Google-Smtp-Source: AGHT+IGwzvFiqu8VpFToMmmcA7U9iG2z/ywVQ47cTrQSvOxP5phNhLphE1cBIhe6aV5K+n6DMKiNtg==
X-Received: by 2002:a05:6000:2089:b0:3eb:2437:97c5 with SMTP id
 ffacd0b85a97d-40e468e7384mr10719132f8f.22.1758993477166; 
 Sat, 27 Sep 2025 10:17:57 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72face8sm11607504f8f.5.2025.09.27.10.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 10:17:56 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B9AC55F820;
 Sat, 27 Sep 2025 18:17:54 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Kyle Evans
 <kevans@freebsd.org>,  Yonggang Luo <luoyonggang@gmail.com>,  Li-Wen Hsu
 <lwhsu@freebsd.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Warner Losh <imp@bsdimp.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ed Maste <emaste@freebsd.org>,  devel@lists.libvirt.org,
 qemu-rust@nongnu.org,  Kohei Tokunaga <ktokunaga.mail@gmail.com>
Subject: Re: [PATCH v2 00/27] CI/build-sys fixes to enable Rust more widely
In-Reply-To: <20250924120426.2158655-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 24 Sep 2025 16:03:57 +0400")
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.12.13; emacs 30.1
Date: Sat, 27 Sep 2025 18:17:54 +0100
Message-ID: <87y0pzg6gt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> This patch series fixes a number of issues with the build system and CI a=
nd
> enable Rust for many of our jobs, getting us closer to enable Rust by def=
ault.
>
> emscripten is difficult to enable, help welcome.

Also I think:

  https://gitlab.com/stsquad/qemu/-/pipelines/2065603411

And the:
  debian-armhf-cross
  debian-i686-cross
  debian-mipsel-cross
  debian-mips64el-cross
  debian-ppc64el-cross
  debian-riscv64-cross

cross builds fail.

>
> v2:
> - add a rust-to-clang-target-test.sh configure script
> - drop "RFC: configure: use the same machine as the host triple"
> - replace "tests: move mips to debian-legacy-test-cross" with "RFC: build=
-sys: deprecate mips host"
> - start tackling emscripten
> - fix mis-placed submodule update
> - other minor changes, commit message tweaks, bz links
> - add r-b tags
>
> Marc-Andr=C3=A9 Lureau (27):
>   build-sys: require -lrt when no shm_open() in std libs
>   gitlab-ci: fix 'needs' property type must be array
>   scripts/archive-source: speed up downloading subprojects
>   scripts/archive-source: silence subprojects downloads
>   scripts/archive-source: use a bash array
>   configure: fix rust meson configuration
>   configure: set the bindgen cross target
>   tests/docker/common: print errors to stderr
>   tests/docker: use fully qualified image name for emsdk
>   tests/docker/common: print meson log on configure failure
>   build-sys: cfi_debug and safe_stack are not compatible
>   lcitool: update, switch to f41
>   lcitool/qemu: include libclang-rt for TSAN
>   lcitool/alpine: workaround bindgen issue
>   tests/lcitool: add missing rust-std dep
>   tests/lcitool: update to debian13
>   tests/docker: add ENABLE_RUST environment
>   tests/lcitool: enable rust & refresh
>   configure: set the meson executable suffix/ext
>   tests/freebsd: enable Rust
>   meson: rust-bindgen limit allowlist-file to srcdir/include
>   RFC: tests/docker: add rust to debian-legacy-test-cross
>   WIP: gitlab-ci: enable rust for msys2-64bit
>   WIP: cirrus/macos: enable Rust
>   RFC: build-sys: deprecate mips host
>   build-sys: pass -fvisibility=3Ddefault for wasm bindgen
>   WIP: enable rust for wasm/emscripten
>
>  docs/about/build-platforms.rst                |  2 -
>  docs/about/deprecated.rst                     |  9 +--
>  configure                                     | 27 +++++++-
>  meson.build                                   | 34 +++++++---
>  .gitlab-ci.d/buildtest-template.yml           |  2 +-
>  .gitlab-ci.d/buildtest.yml                    | 66 +++++++++----------
>  .gitlab-ci.d/cirrus.yml                       |  4 +-
>  .gitlab-ci.d/crossbuilds.yml                  | 46 ++++++-------
>  .gitlab-ci.d/static_checks.yml                |  6 +-
>  .gitlab-ci.d/windows.yml                      |  8 ++-
>  rust/bql/meson.build                          |  1 +
>  rust/chardev/meson.build                      |  1 +
>  rust/hw/char/pl011/meson.build                |  1 +
>  rust/hw/core/meson.build                      |  1 +
>  rust/migration/meson.build                    |  3 +-
>  rust/qom/meson.build                          |  1 +
>  rust/system/meson.build                       |  1 +
>  rust/util/meson.build                         |  1 +
>  scripts/archive-source.sh                     | 33 +++++++---
>  .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  |  5 +-
>  .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    |  5 +-
>  scripts/rust-to-clang-target-test.sh          | 43 ++++++++++++
>  scripts/rust-to-clang-target.sh               | 62 +++++++++++++++++
>  tests/docker/common.rc                        | 11 +++-
>  tests/docker/dockerfiles/alpine.docker        |  6 +-
>  tests/docker/dockerfiles/centos9.docker       |  4 ++
>  .../dockerfiles/debian-amd64-cross.docker     | 18 +++--
>  .../dockerfiles/debian-arm64-cross.docker     | 18 +++--
>  .../dockerfiles/debian-armhf-cross.docker     | 21 +++---
>  .../dockerfiles/debian-i686-cross.docker      | 20 ++++--
>  .../debian-legacy-test-cross.docker           |  9 ++-
>  .../dockerfiles/debian-mips64el-cross.docker  |  9 ++-
>  .../dockerfiles/debian-mipsel-cross.docker    |  9 ++-
>  .../dockerfiles/debian-ppc64el-cross.docker   | 18 +++--
>  .../dockerfiles/debian-riscv64-cross.docker   | 10 ++-
>  .../dockerfiles/debian-s390x-cross.docker     | 18 +++--
>  tests/docker/dockerfiles/debian.docker        | 18 +++--
>  .../dockerfiles/emsdk-wasm32-cross.docker     | 29 +++++++-
>  .../dockerfiles/fedora-rust-nightly.docker    | 18 +++--
>  .../dockerfiles/fedora-win64-cross.docker     | 15 +++--
>  tests/docker/dockerfiles/fedora.docker        | 18 +++--
>  tests/docker/dockerfiles/opensuse-leap.docker |  7 +-
>  tests/docker/dockerfiles/ubuntu2204.docker    |  7 +-
>  tests/docker/test-wasm                        | 12 ++++
>  tests/lcitool/libvirt-ci                      |  2 +-
>  tests/lcitool/projects/qemu.yml               |  3 +-
>  tests/lcitool/refresh                         | 48 +++++++++-----
>  tests/vm/freebsd                              |  4 +-
>  48 files changed, 531 insertions(+), 183 deletions(-)
>  create mode 100755 scripts/rust-to-clang-target-test.sh
>  create mode 100644 scripts/rust-to-clang-target.sh
>  create mode 100755 tests/docker/test-wasm

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

