Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D095C5DF66
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 13:46:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wvxf9-0003Sg-MT; Mon, 17 Aug 2026 09:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxf6-0003RQ-Hk
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvxf3-00020D-Q5
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 09:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786974357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rllvGIn3iFQXn11c9TWiFqPeueISMYtkIaijQS14PLo=;
 b=c8xmmMLZqGJ8hLWMl6DThJ6D6lvY4irTeRyACBT4SLq00m3Ih7MidGZHvHcaxyno2mbsgk
 hLWFfpnJNh3sY/qxuvAqeBlnOYh7wMc9abCHG9deUK0SeJWMV6bOUBfsxBq1VosNRB27Ny
 x/ppT8H+V+AYTwvX3QPDDQf8wgbIULI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-rl37GcxGME2ig7HNMbVV-g-1; Mon, 17 Aug 2026 09:45:50 -0400
X-MC-Unique: rl37GcxGME2ig7HNMbVV-g-1
X-Mimecast-MFC-AGG-ID: rl37GcxGME2ig7HNMbVV-g_1786974349
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-496b61bd846so24165415e9.2
 for <qemu-rust@nongnu.org>; Mon, 17 Aug 2026 06:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786974349; x=1787579149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rllvGIn3iFQXn11c9TWiFqPeueISMYtkIaijQS14PLo=;
 b=BIgT/D5yMFMg5MhEUyVjM9qbvNd2ax7RQcrFz3joIJsEYqwMPSnoo/2GlM+HAXiGTo
 x3EwRf9FSlmEOhv1be91a3icFQfpj0nDD/IZcTEvioubeVsCyzoj+eQwdZwjIDpapWWE
 b5uDGaQM9OW8+COibn4/mQjPPLYfNL3Y9GPMbQknoTdwCeQBv3LWN7JAO5pu1/hbkBfA
 8fZOWG3fFUC8K+0NHLwk3mhjAjP0AfixqyR3CVlM0/lvLCOKgrlQLtC3CtUXLQiHIMna
 UtfuJ282RPvcvSwsMllBkhrzLWLN9/Zzzu/eZldw6rqHArhwGR8/qowfw4GLNMhGqJzX
 Tn0Q==
X-Gm-Message-State: AOJu0YyxFJbD8wE1BaWULOI3qccbw2igLtXc2lE62lSHp19nlPuE37Ko
 aUNCzU+zqg0WTSd/rnFf3UhC79OlpOAi45OSWlU8LFMnVzwRPEcUc2ylZArNOS5MGaqKMhBj7A+
 CpKRpu7fXD/CH4SoL5mrb5gFRrvFEdLbFUCJwkD/gTAyePD6M0OMA4m4C9XQJvPA=
X-Gm-Gg: AR+sD11u7rEZAEMNohhF88FrX3y39bgcFJ6v4LlUQSVjQ0zWPZ8tIIg4EMF3jnd8ZT5
 rx45pxK9Kv93YU097LOJgdVqCeB1NgHoiKE+Urz6L/kbVypJbirtWjerhyLysJg0a3eIaEc/TYD
 edeH1wBJpLhigwgw52WAMxAXfITsycWg3mg84ByV2yQWTv9qFXyu2QI1r9AyxoKB2FFdejfotJB
 L/EVRgSgAEhopOCxb+vznfZR7hLxKEnXXdmxU37u/9QzFvdmK8qLDhTc5nYkc8Rjp1yQv5cReU2
 jE/uJ0A9QD+Ld+8jAMUB7fJOOdptGjrK6w0mkDiwxFMQ2aQbvfCZU6uxwUXx4aRRsIym3vj3Pxg
 Rc95X+96eA5Dm1aFd0aQOwjEKOVr5WJLCmvfGD8vYnnqb4hXG+m1KEgf1WMB4VROalkuhWxaKBO
 Eibkg=
X-Received: by 2002:a05:600c:5306:b0:498:952:e276 with SMTP id
 5b1f17b1804b1-4999fafdb79mr6089455e9.8.1786974348896; 
 Mon, 17 Aug 2026 06:45:48 -0700 (PDT)
X-Received: by 2002:a05:600c:5306:b0:498:952:e276 with SMTP id
 5b1f17b1804b1-4999fafdb79mr6088415e9.8.1786974348380; 
 Mon, 17 Aug 2026 06:45:48 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d0876b8sm59172475e9.8.2026.08.17.06.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 06:45:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/9] rust: switch to cargo subprojects
Date: Mon, 17 Aug 2026 15:45:31 +0200
Message-ID: <20260817134538.924615-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817134538.924615-1-pbonzini@redhat.com>
References: <20260817134538.924615-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ow0CPw5fQ8sd5ryJf0gGM-dbWRHr2pcPGWgIwvK5YRo_1786974349
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Let Meson parse Cargo.lock and Cargo.toml and figure out the set
of Rust build dependencies.  For now, the only change is that
subprojects are retrieved with "cargo_ws.subproject('NAME')"
instead of "subproject('NAME-API-rs')".  However, just calling
"import('rust').workspace()" enables extra functionality that
operates by parsing Cargo.toml; it will be introduced a step
at a time in subsequent commits.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst                         |  8 ++---
 meson.build                                 |  3 +-
 .gitlab-ci.d/static_checks.yml              |  4 +--
 rust/Cargo.lock => Cargo.lock               |  0
 rust/Cargo.toml => Cargo.toml               |  6 ++--
 rust/meson.build                            | 37 +++++++--------------
 subprojects/anyhow-1-rs.wrap                |  2 +-
 subprojects/arbitrary-int-1-rs.wrap         |  2 +-
 subprojects/attrs-0.2-rs.wrap               |  2 +-
 subprojects/bilge-0.2-rs.wrap               |  2 +-
 subprojects/bilge-impl-0.2-rs.wrap          |  2 +-
 subprojects/either-1-rs.wrap                |  2 +-
 subprojects/foreign-0.3-rs.wrap             |  2 +-
 subprojects/glib-sys-0.21-rs.wrap           |  2 +-
 subprojects/itertools-0.11-rs.wrap          |  2 +-
 subprojects/libc-0.2-rs.wrap                |  2 +-
 subprojects/probe-0.5-rs.wrap               |  2 +-
 subprojects/proc-macro-error-1-rs.wrap      |  2 +-
 subprojects/proc-macro-error-attr-1-rs.wrap |  2 +-
 subprojects/proc-macro2-1-rs.wrap           |  2 +-
 subprojects/quote-1-rs.wrap                 |  2 +-
 subprojects/syn-2-rs.wrap                   |  2 +-
 subprojects/unicode-ident-1-rs.wrap         |  2 +-
 23 files changed, 40 insertions(+), 52 deletions(-)
 rename rust/Cargo.lock => Cargo.lock (100%)
 rename rust/Cargo.toml => Cargo.toml (97%)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 67ea84539a2..af142c4a694 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -26,14 +26,14 @@ are accustomed to the more "normal" Cargo-based development workflow.
 In particular:
 
 * the set of warnings and lints that are used to build QEMU always
-  comes from the ``rust/Cargo.toml`` workspace file
+  comes from the ``Cargo.toml`` workspace file
 
 * it is also possible to use ``cargo`` for common Rust-specific coding
   tasks, in particular to invoke ``clippy``, ``rustfmt`` and ``rustdoc``.
 
 To this end, QEMU includes a ``build.rs`` build script that picks up
 generated sources from QEMU's build directory and puts it in Cargo's
-output directory (typically ``rust/target/``).  A vanilla invocation
+output directory (typically ``target/``).  A vanilla invocation
 of Cargo will complain that it cannot find the generated sources,
 which can be fixed in different ways:
 
@@ -475,8 +475,8 @@ files, it is still highly experimental and is therefore not used.
 
 Therefore, external crates must be added as subprojects for Meson to
 learn how to build them, as well as to the relevant ``Cargo.toml`` files.
-The versions specified in ``rust/Cargo.lock`` must be the same as the
-subprojects; note that the ``rust/`` directory forms a Cargo `workspace`__,
+The versions specified in ``Cargo.lock`` must be the same as the
+subprojects; note that the QEMU source tree forms a Cargo `workspace`__,
 and therefore there is a single lock file for the whole build.
 
 __ https://doc.rust-lang.org/cargo/reference/workspaces.html#virtual-workspace
diff --git a/meson.build b/meson.build
index 40e3f4ec44c..2a289960ee8 100644
--- a/meson.build
+++ b/meson.build
@@ -130,7 +130,8 @@ endif
 if have_rust
   rustc_args = [find_program('scripts/rust/rustc_args.py'),
     '--rustc-version', rustc.version(),
-    '--workspace', meson.project_source_root() / 'rust']
+    '--workspace', meson.project_source_root()]
+
   rustfmt = find_program('rustfmt', required: false)
 
   rustc_lint_args = run_command(rustc_args, '--lints',
diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 61fe2fa39ab..568e56e1204 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -55,7 +55,7 @@ check-rust-tools-nightly:
     - source scripts/ci/gitlab-ci-section
     - section_start test "Running Rust code checks"
     - cd build
-    - pyvenv/bin/meson devenv -w ../rust ${CARGO-cargo} fmt --check
+    - pyvenv/bin/meson devenv -w ../ ${CARGO-cargo} fmt --check
     - make clippy
     - make rustdoc
     - section_end test
@@ -69,7 +69,7 @@ check-rust-tools-nightly:
     when: on_success
     expire_in: 2 days
     paths:
-      - rust/target/doc
+      - target/doc
 
 check-build-units:
   extends: .base_job_template
diff --git a/rust/Cargo.lock b/Cargo.lock
similarity index 100%
rename from rust/Cargo.lock
rename to Cargo.lock
diff --git a/rust/Cargo.toml b/Cargo.toml
similarity index 97%
rename from rust/Cargo.toml
rename to Cargo.toml
index 0d24eb84e1c..0566850ecef 100644
--- a/rust/Cargo.toml
+++ b/Cargo.toml
@@ -1,9 +1,9 @@
 [workspace]
 resolver = "2"
 members = [
-    "hw/char/pl011",
-    "hw/timer/hpet",
-    "tests",
+    "rust/hw/char/pl011",
+    "rust/hw/timer/hpet",
+    "rust/tests",
 ]
 
 [workspace.package]
diff --git a/rust/meson.build b/rust/meson.build
index b6711fe77dd..1622a50a978 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -4,31 +4,18 @@ else
   message('Rust enabled but it is only used by system emulators.')
 endif
 
-subproject('anyhow-1-rs', required: true)
-subproject('bilge-0.2-rs', required: true)
-subproject('bilge-impl-0.2-rs', required: true)
-subproject('foreign-0.3-rs', required: true)
-subproject('glib-sys-0.21-rs', required: true)
-subproject('libc-0.2-rs', required: true)
-subproject('probe-0.5-rs', required: true)
-
-anyhow_rs = dependency('anyhow-1-rs')
-bilge_rs = dependency('bilge-0.2-rs')
-bilge_impl_rs = dependency('bilge-impl-0.2-rs')
-foreign_rs = dependency('foreign-0.3-rs')
-glib_sys_rs = dependency('glib-sys-0.21-rs')
-libc_rs = dependency('libc-0.2-rs')
-probe_rs = dependency('probe-0.5-rs')
-
-subproject('proc-macro2-1-rs', required: true)
-subproject('quote-1-rs', required: true)
-subproject('syn-2-rs', required: true)
-subproject('attrs-0.2-rs', required: true)
-
-quote_rs_native = dependency('quote-1-rs', native: true)
-syn_rs_native = dependency('syn-2-rs', native: true)
-proc_macro2_rs_native = dependency('proc-macro2-1-rs', native: true)
-attrs_rs_native = dependency('attrs-0.2-rs', native: true)
+cargo_ws = import('rust').workspace()
+anyhow_rs = cargo_ws.subproject('anyhow').dependency()
+bilge_rs = cargo_ws.subproject('bilge').dependency()
+bilge_impl_rs = cargo_ws.subproject('bilge-impl').dependency()
+foreign_rs = cargo_ws.subproject('foreign').dependency()
+glib_sys_rs = cargo_ws.subproject('glib-sys').dependency()
+libc_rs = cargo_ws.subproject('libc').dependency()
+probe_rs = cargo_ws.subproject('probe').dependency()
+quote_rs_native = cargo_ws.subproject('quote').dependency()
+syn_rs_native = cargo_ws.subproject('syn').dependency()
+proc_macro2_rs_native = cargo_ws.subproject('proc-macro2').dependency()
+attrs_rs_native = cargo_ws.subproject('attrs').dependency()
 
 genrs = []
 
diff --git a/subprojects/anyhow-1-rs.wrap b/subprojects/anyhow-1-rs.wrap
index a69a3645b49..fb4603e74c8 100644
--- a/subprojects/anyhow-1-rs.wrap
+++ b/subprojects/anyhow-1-rs.wrap
@@ -3,5 +3,5 @@ directory = anyhow-1.0.98
 source_url = https://crates.io/api/v1/crates/anyhow/1.0.98/download
 source_filename = anyhow-1.0.98.tar.gz
 source_hash = e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487
-#method = cargo
+method = cargo
 patch_directory = anyhow-1-rs
diff --git a/subprojects/arbitrary-int-1-rs.wrap b/subprojects/arbitrary-int-1-rs.wrap
index a1838b20b0f..f8d7c68da64 100644
--- a/subprojects/arbitrary-int-1-rs.wrap
+++ b/subprojects/arbitrary-int-1-rs.wrap
@@ -3,7 +3,7 @@ directory = arbitrary-int-1.2.7
 source_url = https://crates.io/api/v1/crates/arbitrary-int/1.2.7/download
 source_filename = arbitrary-int-1.2.7.tar.gz
 source_hash = c84fc003e338a6f69fbd4f7fe9f92b535ff13e9af8997f3b14b6ddff8b1df46d
-#method = cargo
+method = cargo
 patch_directory = arbitrary-int-1-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/attrs-0.2-rs.wrap b/subprojects/attrs-0.2-rs.wrap
index cd43c91d63e..4ff4c424e6b 100644
--- a/subprojects/attrs-0.2-rs.wrap
+++ b/subprojects/attrs-0.2-rs.wrap
@@ -3,5 +3,5 @@ directory = attrs-0.2.9
 source_url = https://crates.io/api/v1/crates/attrs/0.2.9/download
 source_filename = attrs-0.2.9.tar.gz
 source_hash = 2a207d40f43de65285f3de0509bb6cb16bc46098864fce957122bbacce327e5f
-#method = cargo
+method = cargo
 patch_directory = attrs-0.2-rs
diff --git a/subprojects/bilge-0.2-rs.wrap b/subprojects/bilge-0.2-rs.wrap
index 900bb1497b9..cb202cfd9fe 100644
--- a/subprojects/bilge-0.2-rs.wrap
+++ b/subprojects/bilge-0.2-rs.wrap
@@ -3,7 +3,7 @@ directory = bilge-0.2.0
 source_url = https://crates.io/api/v1/crates/bilge/0.2.0/download
 source_filename = bilge-0.2.0.tar.gz
 source_hash = dc707ed8ebf81de5cd6c7f48f54b4c8621760926cdf35a57000747c512e67b57
-#method = cargo
+method = cargo
 patch_directory = bilge-0.2-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/bilge-impl-0.2-rs.wrap b/subprojects/bilge-impl-0.2-rs.wrap
index 4f84eca1ccd..b3dbfafb265 100644
--- a/subprojects/bilge-impl-0.2-rs.wrap
+++ b/subprojects/bilge-impl-0.2-rs.wrap
@@ -3,7 +3,7 @@ directory = bilge-impl-0.2.0
 source_url = https://crates.io/api/v1/crates/bilge-impl/0.2.0/download
 source_filename = bilge-impl-0.2.0.tar.gz
 source_hash = feb11e002038ad243af39c2068c8a72bcf147acf05025dcdb916fcc000adb2d8
-#method = cargo
+method = cargo
 patch_directory = bilge-impl-0.2-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/either-1-rs.wrap b/subprojects/either-1-rs.wrap
index 352e11cfee6..1c74a95645f 100644
--- a/subprojects/either-1-rs.wrap
+++ b/subprojects/either-1-rs.wrap
@@ -3,7 +3,7 @@ directory = either-1.12.0
 source_url = https://crates.io/api/v1/crates/either/1.12.0/download
 source_filename = either-1.12.0.tar.gz
 source_hash = 3dca9240753cf90908d7e4aac30f630662b02aebaa1b58a3cadabdb23385b58b
-#method = cargo
+method = cargo
 patch_directory = either-1-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/foreign-0.3-rs.wrap b/subprojects/foreign-0.3-rs.wrap
index 0d218ec2c25..a5fec6c09df 100644
--- a/subprojects/foreign-0.3-rs.wrap
+++ b/subprojects/foreign-0.3-rs.wrap
@@ -3,5 +3,5 @@ directory = foreign-0.3.1
 source_url = https://crates.io/api/v1/crates/foreign/0.3.1/download
 source_filename = foreign-0.3.1.tar.gz
 source_hash = 17ca1b5be8c9d320daf386f1809c7acc0cb09accbae795c2001953fa50585846
-#method = cargo
+method = cargo
 patch_directory = foreign-0.3-rs
diff --git a/subprojects/glib-sys-0.21-rs.wrap b/subprojects/glib-sys-0.21-rs.wrap
index 313ced731ac..f4e1514af57 100644
--- a/subprojects/glib-sys-0.21-rs.wrap
+++ b/subprojects/glib-sys-0.21-rs.wrap
@@ -3,5 +3,5 @@ directory = glib-sys-0.21.2
 source_url = https://crates.io/api/v1/crates/glib-sys/0.21.2/download
 source_filename = glib-sys-0.21.2.tar.gz
 source_hash = d09d3d0fddf7239521674e57b0465dfbd844632fec54f059f7f56112e3f927e1
-#method = cargo
+method = cargo
 patch_directory = glib-sys-0.21-rs
diff --git a/subprojects/itertools-0.11-rs.wrap b/subprojects/itertools-0.11-rs.wrap
index ee12d0053bc..6fe89d17caa 100644
--- a/subprojects/itertools-0.11-rs.wrap
+++ b/subprojects/itertools-0.11-rs.wrap
@@ -3,7 +3,7 @@ directory = itertools-0.11.0
 source_url = https://crates.io/api/v1/crates/itertools/0.11.0/download
 source_filename = itertools-0.11.0.tar.gz
 source_hash = b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57
-#method = cargo
+method = cargo
 patch_directory = itertools-0.11-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/libc-0.2-rs.wrap b/subprojects/libc-0.2-rs.wrap
index bbe08f87883..488330178ed 100644
--- a/subprojects/libc-0.2-rs.wrap
+++ b/subprojects/libc-0.2-rs.wrap
@@ -3,5 +3,5 @@ directory = libc-0.2.162
 source_url = https://crates.io/api/v1/crates/libc/0.2.162/download
 source_filename = libc-0.2.162.tar.gz
 source_hash = 18d287de67fe55fd7e1581fe933d965a5a9477b38e949cfa9f8574ef01506398
-#method = cargo
+method = cargo
 patch_directory = libc-0.2-rs
diff --git a/subprojects/probe-0.5-rs.wrap b/subprojects/probe-0.5-rs.wrap
index 73229ee1c29..d3c6b187244 100644
--- a/subprojects/probe-0.5-rs.wrap
+++ b/subprojects/probe-0.5-rs.wrap
@@ -3,5 +3,5 @@ directory = probe-0.5.2
 source_url = https://crates.io/api/v1/crates/probe/0.5.2/download
 source_filename = probe-0.5.2.tar.gz
 source_hash = 136558b6e1ebaecc92755d0ffaf9421f519531bed30cc2ad23b22cb00965cc5e
-#method = cargo
+method = cargo
 patch_directory = probe-0.5-rs
diff --git a/subprojects/proc-macro-error-1-rs.wrap b/subprojects/proc-macro-error-1-rs.wrap
index 59f892f7825..4f300c3ac41 100644
--- a/subprojects/proc-macro-error-1-rs.wrap
+++ b/subprojects/proc-macro-error-1-rs.wrap
@@ -3,7 +3,7 @@ directory = proc-macro-error-1.0.4
 source_url = https://crates.io/api/v1/crates/proc-macro-error/1.0.4/download
 source_filename = proc-macro-error-1.0.4.tar.gz
 source_hash = da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
-#method = cargo
+method = cargo
 patch_directory = proc-macro-error-1-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/proc-macro-error-attr-1-rs.wrap b/subprojects/proc-macro-error-attr-1-rs.wrap
index 5aeb224a103..739e451c37b 100644
--- a/subprojects/proc-macro-error-attr-1-rs.wrap
+++ b/subprojects/proc-macro-error-attr-1-rs.wrap
@@ -3,7 +3,7 @@ directory = proc-macro-error-attr-1.0.4
 source_url = https://crates.io/api/v1/crates/proc-macro-error-attr/1.0.4/download
 source_filename = proc-macro-error-attr-1.0.4.tar.gz
 source_hash = a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
-#method = cargo
+method = cargo
 patch_directory = proc-macro-error-attr-1-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/proc-macro2-1-rs.wrap b/subprojects/proc-macro2-1-rs.wrap
index 0f06cd8e111..3600f4eb191 100644
--- a/subprojects/proc-macro2-1-rs.wrap
+++ b/subprojects/proc-macro2-1-rs.wrap
@@ -3,7 +3,7 @@ directory = proc-macro2-1.0.95
 source_url = https://crates.io/api/v1/crates/proc-macro2/1.0.95/download
 source_filename = proc-macro2-1.0.95.0.tar.gz
 source_hash = 02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778
-#method = cargo
+method = cargo
 patch_directory = proc-macro2-1-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/quote-1-rs.wrap b/subprojects/quote-1-rs.wrap
index 8b721dfa00b..10626be6521 100644
--- a/subprojects/quote-1-rs.wrap
+++ b/subprojects/quote-1-rs.wrap
@@ -3,7 +3,7 @@ directory = quote-1.0.36
 source_url = https://crates.io/api/v1/crates/quote/1.0.36/download
 source_filename = quote-1.0.36.0.tar.gz
 source_hash = 0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7
-#method = cargo
+method = cargo
 patch_directory = quote-1-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/syn-2-rs.wrap b/subprojects/syn-2-rs.wrap
index 1e5e9d9fb6e..db6576f5812 100644
--- a/subprojects/syn-2-rs.wrap
+++ b/subprojects/syn-2-rs.wrap
@@ -3,7 +3,7 @@ directory = syn-2.0.104
 source_url = https://crates.io/api/v1/crates/syn/2.0.104/download
 source_filename = syn-2.0.104.0.tar.gz
 source_hash = 17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40
-#method = cargo
+method = cargo
 patch_directory = syn-2-rs
 
 # bump this version number on every change to meson.build or the patches:
diff --git a/subprojects/unicode-ident-1-rs.wrap b/subprojects/unicode-ident-1-rs.wrap
index 50988f612e2..b420ebfe1f4 100644
--- a/subprojects/unicode-ident-1-rs.wrap
+++ b/subprojects/unicode-ident-1-rs.wrap
@@ -3,7 +3,7 @@ directory = unicode-ident-1.0.12
 source_url = https://crates.io/api/v1/crates/unicode-ident/1.0.12/download
 source_filename = unicode-ident-1.0.12.tar.gz
 source_hash = 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
-#method = cargo
+method = cargo
 patch_directory = unicode-ident-1-rs
 
 # bump this version number on every change to meson.build or the patches:
-- 
2.55.0


