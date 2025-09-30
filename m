Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8EFCCA470
	for <qemu-rust@archiver.kernel.org>; Tue, 30 Sep 2025 13:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3a0V-0001ho-5Y; Tue, 30 Sep 2025 09:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v3XTL-0003yQ-M4
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 06:20:39 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v3XTE-00086l-Q0
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 06:20:38 -0400
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4da72b541f8so69838891cf.1
 for <qemu-rust@nongnu.org>; Tue, 30 Sep 2025 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759227629; x=1759832429; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxRwNHPrAvkKywEGdIY4WK4ce6M6MwphHcZuR0EA4ZQ=;
 b=QjoH0Ohn6cQPXurz4Lz0rsOlXZIOu3kUQzOquBEJbkfnYQpnDwUmiCtKeYi2dEDQU1
 6BSq5n9fqV1Id9MUSD6yBPixqLVDriQCy/46BirI1O6cUtnoaxlz/jUToWlt9cPGBdJR
 IHVml/Fh8QYF++6YGBILitkEVHa6Ob8A6cwc1bFBE78bHT4bDlx6w1o6JcGScs6Q/S+5
 8C0vMuhrk8679cj5xH3aOpq63GBpJhfhjzoBpGwcwtLLn5iKh72wLkJCg3/frUl3nQws
 NKGRvSroWsmT0UfMBhXAolgloscTUkn7y+ZXrpEdT8u0DI0n80SLjmiBI9UIgH19d0w+
 s/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759227629; x=1759832429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxRwNHPrAvkKywEGdIY4WK4ce6M6MwphHcZuR0EA4ZQ=;
 b=qagSPHI20ZK1x/GpnyP1A6P4QpW0+dsQfp2PlqqU4lNPOrgkVvdeQnPoEjSmGLctSe
 e6ZH1UopSikDGiTofalQiF+i/NydOcQJdcGytZXmi3o8Y6sjF/jjaDU8Ui5OWlPKgJnF
 8nZy5Q4l9fBufImXNYpvcFjd73hAtjwhTM+kSRbD7c2sQYGsbvEbk5pfDznggXQdbpHI
 1FazWpp5zu6ZjGMRBv4E0GS6yMb3w4EOD6Z7amYwwr35gwUO/cAjYjpO4WGJ5sFvj77k
 6CKMR3J7WDYnUDC+wxHHE0NJwtbv53KhkK6vYUid1FFdrHOHtzZayUdLmzEaSPGvmuTt
 VEbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8z64jslLfvZV9KOf3PCcpDFp+4aQOSPEkbfRw83cve5d41XqOIxHoATP4p1BZikUijuyVBC1Mgzk=@nongnu.org
X-Gm-Message-State: AOJu0YxV5TODCGE/POD2B6YRQX24fiwpSp/5bAxcYVcvBwRap62L/DBA
 Jo9qiUw9N5w0czsWyUXBIIV5wXFzL6hMDD3C5q8BrEkxAC1qbsXSje60X44M1g7ScYldVm0CtBw
 NAM/J/J0kmCjCvBDRDzk+zn/hcetc4Cg=
X-Gm-Gg: ASbGncunQTKbz7+2+vY1tGacSIr38ctC3HdxeW87B79RdwUD0N/cBQotu1lG+MdvjP8
 2LPQN77lRcdfShc/s0Pt11flwvpO6iJDtNE7o5eJpMCcvozQ0F/houxG1xwGysJVTVqxp1qnUWs
 B9mklk1VcnFWvmU44ps14YwkozoQAbvevoRnrUHs2BZQCtpEeXd5CRCXrpkJ/sGzOszQYbYIqNr
 09DQ+7lg/yWUoSjGq7ZnR0WQTpvjmCUeDYqCZ5nv6rlj0d68RZV7aImzEPGJcgC3klbaFHy6+I=
X-Google-Smtp-Source: AGHT+IHMzvXHSCmJUO7Vmqafr0tAUZeBwanGYnJCKJexxwRyITVeYAh+1OMNItaQ6nMDcDR29VAZuIzEmNMpNWApG2A=
X-Received: by 2002:a05:622a:1f09:b0:4d9:dea6:4ff0 with SMTP id
 d75a77b69052e-4da4bbe4b06mr297057761cf.56.1759227628806; Tue, 30 Sep 2025
 03:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <87y0pzg6gt.fsf@draig.linaro.org>
 <dd4bc8b8-b50e-4613-b083-73918623c036@redhat.com>
In-Reply-To: <dd4bc8b8-b50e-4613-b083-73918623c036@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Sep 2025 14:20:16 +0400
X-Gm-Features: AS18NWA6srX_HtlFsVsF-36XPA5NAOpk6O1DIw6i6CjAU0jNp4O4Q63sJ2gfSWE
Message-ID: <CAJ+F1C+KZ8Lsu3fD0-Wpw0ReM3p0q94PxaoMLzfhB8mJtjXxzQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] CI/build-sys fixes to enable Rust more widely
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, 
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, 
 qemu-rust@nongnu.org, Kohei Tokunaga <ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 30 Sep 2025 09:02:58 -0400
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

Hi

On Tue, Sep 30, 2025 at 1:09=E2=80=AFPM Paolo Bonzini via Devel
<devel@lists.libvirt.org> wrote:
>
> On 9/27/25 19:17, Alex Benn=C3=A9e wrote:
> > marcandre.lureau@redhat.com writes:
> >
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Hi,
> >>
> >> This patch series fixes a number of issues with the build system and C=
I and
> >> enable Rust for many of our jobs, getting us closer to enable Rust by =
default.
> >>
> >> emscripten is difficult to enable, help welcome.
> >
> > Also I think:
> >
> >    https://gitlab.com/stsquad/qemu/-/pipelines/2065603411
> >
> > And the:
> >    debian-armhf-cross
> >    debian-i686-cross
> >    debian-mipsel-cross
> >    debian-mips64el-cross
> >    debian-ppc64el-cross
> >    debian-riscv64-cross
>
> I'll test 1-21+26 and see what breaks with that subset.
>

I am currently testing with this change:

commit 757ef689a2d13a686411fb5b041412e8c73e36c0
Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Date:   Tue Sep 30 14:16:44 2025 +0400

    fixup! tests/docker: add ENABLE_RUST environment

diff --git a/tests/docker/common.rc b/tests/docker/common.rc
index 52f01848a3..752f4f3aed 100755
--- a/tests/docker/common.rc
+++ b/tests/docker/common.rc
@@ -21,10 +21,12 @@ else
     DEF_TARGET_LIST=3D${DEF_TARGET_LIST:-"x86_64-softmmu,aarch64-softmmu"}
 fi

+enable_rust=3D""
 if [ "$ENABLE_RUST" =3D "1" ]; then
   enable_rust=3D"--enable-rust"
-else
-  enable_rust=3D""
+  if [ -n "$RUST_TARGET" ]; then
+    enable_rust=3D"$enable_rust --rust-target-triple=3D$RUST_TARGET"
+  fi
 fi

 requires_binary()

> Paolo
>
> >
> > cross builds fail.
> >
> >>
> >> v2:
> >> - add a rust-to-clang-target-test.sh configure script
> >> - drop "RFC: configure: use the same machine as the host triple"
> >> - replace "tests: move mips to debian-legacy-test-cross" with "RFC: bu=
ild-sys: deprecate mips host"
> >> - start tackling emscripten
> >> - fix mis-placed submodule update
> >> - other minor changes, commit message tweaks, bz links
> >> - add r-b tags
> >>
> >> Marc-Andr=C3=A9 Lureau (27):
> >>    build-sys: require -lrt when no shm_open() in std libs
> >>    gitlab-ci: fix 'needs' property type must be array
> >>    scripts/archive-source: speed up downloading subprojects
> >>    scripts/archive-source: silence subprojects downloads
> >>    scripts/archive-source: use a bash array
> >>    configure: fix rust meson configuration
> >>    configure: set the bindgen cross target
> >>    tests/docker/common: print errors to stderr
> >>    tests/docker: use fully qualified image name for emsdk
> >>    tests/docker/common: print meson log on configure failure
> >>    build-sys: cfi_debug and safe_stack are not compatible
> >>    lcitool: update, switch to f41
> >>    lcitool/qemu: include libclang-rt for TSAN
> >>    lcitool/alpine: workaround bindgen issue
> >>    tests/lcitool: add missing rust-std dep
> >>    tests/lcitool: update to debian13
> >>    tests/docker: add ENABLE_RUST environment
> >>    tests/lcitool: enable rust & refresh
> >>    configure: set the meson executable suffix/ext
> >>    tests/freebsd: enable Rust
> >>    meson: rust-bindgen limit allowlist-file to srcdir/include
> >>    RFC: tests/docker: add rust to debian-legacy-test-cross
> >>    WIP: gitlab-ci: enable rust for msys2-64bit
> >>    WIP: cirrus/macos: enable Rust
> >>    RFC: build-sys: deprecate mips host
> >>    build-sys: pass -fvisibility=3Ddefault for wasm bindgen
> >>    WIP: enable rust for wasm/emscripten
> >>
> >>   docs/about/build-platforms.rst                |  2 -
> >>   docs/about/deprecated.rst                     |  9 +--
> >>   configure                                     | 27 +++++++-
> >>   meson.build                                   | 34 +++++++---
> >>   .gitlab-ci.d/buildtest-template.yml           |  2 +-
> >>   .gitlab-ci.d/buildtest.yml                    | 66 +++++++++--------=
--
> >>   .gitlab-ci.d/cirrus.yml                       |  4 +-
> >>   .gitlab-ci.d/crossbuilds.yml                  | 46 ++++++-------
> >>   .gitlab-ci.d/static_checks.yml                |  6 +-
> >>   .gitlab-ci.d/windows.yml                      |  8 ++-
> >>   rust/bql/meson.build                          |  1 +
> >>   rust/chardev/meson.build                      |  1 +
> >>   rust/hw/char/pl011/meson.build                |  1 +
> >>   rust/hw/core/meson.build                      |  1 +
> >>   rust/migration/meson.build                    |  3 +-
> >>   rust/qom/meson.build                          |  1 +
> >>   rust/system/meson.build                       |  1 +
> >>   rust/util/meson.build                         |  1 +
> >>   scripts/archive-source.sh                     | 33 +++++++---
> >>   .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  |  5 +-
> >>   .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    |  5 +-
> >>   scripts/rust-to-clang-target-test.sh          | 43 ++++++++++++
> >>   scripts/rust-to-clang-target.sh               | 62 +++++++++++++++++
> >>   tests/docker/common.rc                        | 11 +++-
> >>   tests/docker/dockerfiles/alpine.docker        |  6 +-
> >>   tests/docker/dockerfiles/centos9.docker       |  4 ++
> >>   .../dockerfiles/debian-amd64-cross.docker     | 18 +++--
> >>   .../dockerfiles/debian-arm64-cross.docker     | 18 +++--
> >>   .../dockerfiles/debian-armhf-cross.docker     | 21 +++---
> >>   .../dockerfiles/debian-i686-cross.docker      | 20 ++++--
> >>   .../debian-legacy-test-cross.docker           |  9 ++-
> >>   .../dockerfiles/debian-mips64el-cross.docker  |  9 ++-
> >>   .../dockerfiles/debian-mipsel-cross.docker    |  9 ++-
> >>   .../dockerfiles/debian-ppc64el-cross.docker   | 18 +++--
> >>   .../dockerfiles/debian-riscv64-cross.docker   | 10 ++-
> >>   .../dockerfiles/debian-s390x-cross.docker     | 18 +++--
> >>   tests/docker/dockerfiles/debian.docker        | 18 +++--
> >>   .../dockerfiles/emsdk-wasm32-cross.docker     | 29 +++++++-
> >>   .../dockerfiles/fedora-rust-nightly.docker    | 18 +++--
> >>   .../dockerfiles/fedora-win64-cross.docker     | 15 +++--
> >>   tests/docker/dockerfiles/fedora.docker        | 18 +++--
> >>   tests/docker/dockerfiles/opensuse-leap.docker |  7 +-
> >>   tests/docker/dockerfiles/ubuntu2204.docker    |  7 +-
> >>   tests/docker/test-wasm                        | 12 ++++
> >>   tests/lcitool/libvirt-ci                      |  2 +-
> >>   tests/lcitool/projects/qemu.yml               |  3 +-
> >>   tests/lcitool/refresh                         | 48 +++++++++-----
> >>   tests/vm/freebsd                              |  4 +-
> >>   48 files changed, 531 insertions(+), 183 deletions(-)
> >>   create mode 100755 scripts/rust-to-clang-target-test.sh
> >>   create mode 100644 scripts/rust-to-clang-target.sh
> >>   create mode 100755 tests/docker/test-wasm
> >
>


--=20
Marc-Andr=C3=A9 Lureau

