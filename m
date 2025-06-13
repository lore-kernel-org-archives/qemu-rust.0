Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uQ43l-0000FJ-4M
	for mharc-qemu-rust@gnu.org; Fri, 13 Jun 2025 09:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uQ43g-000082-PD
 for qemu-rust@nongnu.org; Fri, 13 Jun 2025 09:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uQ43f-0000YB-13
 for qemu-rust@nongnu.org; Fri, 13 Jun 2025 09:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749819777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5umpPvvgjn/tpYWRO7zkHG7cUrCidjwdnI8p2wrau8=;
 b=i/ZIYgN4w8ztienA11tQFgNk4mtQ1iBAWAdISvy2X7E0gL3byCtMf6hDgbljP9GrH3ZAkf
 yCPL5sOrrJ/q+cy4T72nJnrHlRafwqtGyRKToZMtSQqH0RTirgfEsclKUkskYqLlhMuEVM
 /VMU+MR9xmuDRC9wNnoF4LSu6zGbDvQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-b3ac8ms1NM-xDxGOUPFvHg-1; Fri, 13 Jun 2025 09:02:55 -0400
X-MC-Unique: b3ac8ms1NM-xDxGOUPFvHg-1
X-Mimecast-MFC-AGG-ID: b3ac8ms1NM-xDxGOUPFvHg_1749819774
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a5232c6ae8so974192f8f.3
 for <qemu-rust@nongnu.org>; Fri, 13 Jun 2025 06:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749819774; x=1750424574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5umpPvvgjn/tpYWRO7zkHG7cUrCidjwdnI8p2wrau8=;
 b=tDL0E/QtMakM2tyl4o1ywaJPQmvt9uSGLpjS87jCTGIjL7ZxRVAnE7KdtpsUO0fS/9
 vSnKuaA6ksQ25E0X6rD12sCAcAmPwJtIc9VZuWjEw6Okxk1WiZELU1rYTxwW5KPfyGv7
 SJoTJ+hXTHtS6WfO306RutHsBLxnlr+IlE0IVjNAbaElnKsbfAEJEVRDm35rpSU7MinE
 zBXjmzuye/uLUp8FjY7knb5bxSzQijM+DEWql/qT/qF/PlD3gpgaeX6a6oSXiTWSm4h+
 B9/01A2RO9VIRJA5gTO3Q2maF/ORvv5SRX8hyVyYECOdU+0VL7gr85eFEOBVlM3ruvK1
 kU8Q==
X-Gm-Message-State: AOJu0YwfK9RGqC34I/evkEARUyGVPPZ/yn9yqI1HMOxehaO1JPbTD5ei
 4CvD4qMoK6janQzNSISJtRjXZcxEPdGh8Wsnd1wQBlVSPh94R7GnELZbk2rFzgi/y3XPAio2jJI
 4feD9HLFmcOZxCZ/asUXCQ2tDgc83v/cVwJfk2p7sdcoQAnnQPyDqQvE=
X-Gm-Gg: ASbGnctBqyrGAqHMwC0nEIEEFDCLmyh5gKbQ5LeK3n+3yjCybhXlad3pw8RqfvqFSBv
 jktqWBTXlD+T/lr5i4UT3aUt7vdVm1JvPcQuve3fZFksdsJUlXSRtzaciVWZodQMAoB06s8M++u
 jB8KOQftMcaLyzhpXf4oD3ACaeAH1WHMTH6tO/mEwCrkh5Q7zjkX/i1n7mKGHaecnyXVET9j3X3
 pBnsvB7jc8yjjVl6vLtwEZCsGvEZJNFtLUHBSvfqU0EEHWKA1m6icET79pPQHyuXYId8BGErPbg
 lk/GsJo2GqizlHVEymf44L7I
X-Received: by 2002:a05:6000:2289:b0:3a5:2182:bce2 with SMTP id
 ffacd0b85a97d-3a568670d35mr3093286f8f.17.1749819773601; 
 Fri, 13 Jun 2025 06:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7dPESzSJnMQK9ul1O+mcXOPsRqx6aLMWAt7BLIxvMa/wM99XZ8vHkYYbz9ON6yclE7voXKw==
X-Received: by 2002:a05:6000:2289:b0:3a5:2182:bce2 with SMTP id
 ffacd0b85a97d-3a568670d35mr3093142f8f.17.1749819772004; 
 Fri, 13 Jun 2025 06:02:52 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b087f8sm2338302f8f.53.2025.06.13.06.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:02:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	tanishdesai37@gmail.com
Subject: [PATCH 1/2] rust: prepare variable definitions for multiple bindgen
 invocations
Date: Fri, 13 Jun 2025 15:02:48 +0200
Message-ID: <20250613130249.1225545-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613130249.1225545-1-pbonzini@redhat.com>
References: <20250613130249.1225545-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -H6Tx6viQeZ2JSFqSUFTuKk0n2PkA4lbLlTkfMyWCiM_1749819774
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 Jun 2025 13:03:01 -0000

When splitting the QEMU Rust bindings into multiple crates, the
bindgen-generated structs also have to be split so that it's
possible to add "impl" blocks (e.g. for Sync/Send or Default,
or even for utility methods in cases such as VMStateFlags).

Tweak various variable definitions in meson.build, to avoid naming
conflicts once there will be multiple bindgen invocations.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build               | 21 ++++++++++++---------
 rust/meson.build          |  2 +-
 rust/qemu-api/meson.build |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index ed60be2a2d0..d9838319dae 100644
--- a/meson.build
+++ b/meson.build
@@ -4200,10 +4200,11 @@ foreach target_base_arch, config_base_arch : config_base_arch_mak
 endforeach
 
 if have_rust
+  bindings_incdir = include_directories('.', 'include')
   # We would like to use --generate-cstr, but it is only available
   # starting with bindgen 0.66.0.  The oldest supported versions
   # is 0.60.x (Debian 12 has 0.60.1) which introduces --allowlist-file.
-  bindgen_args = [
+  bindgen_args_common = [
     '--disable-header-comment',
     '--raw-line', '// @generated',
     '--ctypes-prefix', 'std::os::raw',
@@ -4219,20 +4220,22 @@ if have_rust
     ]
   if not rustfmt.found()
     if bindgen.version().version_compare('<0.65.0')
-      bindgen_args += ['--no-rustfmt-bindings']
+      bindgen_args_common += ['--no-rustfmt-bindings']
     else
-      bindgen_args += ['--formatter', 'none']
+      bindgen_args_common += ['--formatter', 'none']
     endif
   endif
   if bindgen.version().version_compare('>=0.66.0')
-    bindgen_args += ['--rust-target', '1.59']
+    bindgen_args_common += ['--rust-target', '1.59']
   endif
   if bindgen.version().version_compare('<0.61.0')
     # default in 0.61+
-    bindgen_args += ['--size_t-is-usize']
+    bindgen_args_common += ['--size_t-is-usize']
   else
-    bindgen_args += ['--merge-extern-blocks']
+    bindgen_args_common += ['--merge-extern-blocks']
   endif
+
+  bindgen_args = []
   c_enums = [
     'DeviceCategory',
     'GpioPolarity',
@@ -4264,13 +4267,13 @@ if have_rust
   # this case you must pass the path to `clang` and `libclang` to your build
   # command invocation using the environment variables CLANG_PATH and
   # LIBCLANG_PATH
-  bindings_rs = rust.bindgen(
+  _qemu_api_bindings_inc_rs = rust.bindgen(
     input: 'rust/wrapper.h',
     dependencies: common_ss.all_dependencies(),
     output: 'bindings.inc.rs',
-    include_directories: include_directories('.', 'include'),
+    include_directories: bindings_incdir,
     bindgen_version: ['>=0.60.0'],
-    args: bindgen_args,
+    args: bindgen_args_common + bindgen_args,
     )
   subdir('rust')
 endif
diff --git a/rust/meson.build b/rust/meson.build
index 99ae7956cd0..e9f0879e296 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -33,5 +33,5 @@ if cargo.found()
     command: [config_host['MESON'], 'devenv',
               '--workdir', '@CURRENT_SOURCE_DIR@',
               cargo, 'fmt'],
-    depends: bindings_rs)
+    depends: _qemu_api_bindings_inc_rs)
 endif
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 33653b4a28e..64c04dfd74b 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -32,7 +32,7 @@ _qemu_api_rs = static_library(
       'src/vmstate.rs',
       'src/zeroable.rs',
     ],
-    {'.' : bindings_rs},
+    {'.' : _qemu_api_bindings_inc_rs},
   ),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
-- 
2.49.0


