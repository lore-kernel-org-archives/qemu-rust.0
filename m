Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37298D5B16C
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:51:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3MJ-0000uv-1y; Mon, 15 Dec 2025 02:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Ld-0000cL-L5
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3Lc-0000mk-2H
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEafbVoFGYyLMte4h/94bksiLJPMQ531LWBYvtDlkGg=;
 b=f17h3Swt31mJZkubTV5yD8eKizqn1F+eG4rtCYggIticycfLThYNxxS1U2uikoHKG680sv
 AQ57MdLgbOHRvVKEYDh25Tp4qR2y8UEG2/+dWrq8AcybZCf8+dBZl1aZC7EugOdO32Y9KG
 fc+WMUScCyeitWKo6NNsRjJeCmRZf3A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-usLqEwpIOuin-i_yO1DXlQ-1; Mon, 15 Dec 2025 02:50:22 -0500
X-MC-Unique: usLqEwpIOuin-i_yO1DXlQ-1
X-Mimecast-MFC-AGG-ID: usLqEwpIOuin-i_yO1DXlQ_1765785021
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779d8fd4ecso15222295e9.1
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785021; x=1766389821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vEafbVoFGYyLMte4h/94bksiLJPMQ531LWBYvtDlkGg=;
 b=gsksIiW9YPklG3sqn8xupZkYa2NUfkCcxaFMHE5ujQmn+faMPZhRNf0K6iLjMrwPA7
 LRA2TqMcEMtd/ayAGvknRgPXckaxeuhWhxm97cAe0f6MNTd7bL0Kv1bhU4UqFqBWW8pF
 9DKPjlOgobStGRzGRzm2o4dx1VS3d01+O1Cbwa2oZmS/McALqr82nbHE4IGFlARaMEIQ
 A/v9kyE+m3z2222z9MSA6tMnCSNFPGyQ0ySUpUBN+tA3irwSH1EEAmrSI8YO8Z5ptLOj
 cvMsnPTiQ7MTr3SudQ2/GGCExJFlzGm+cw3O3uFB3/bP5dLCHIDSbb2HlzuUGqolayQj
 FouQ==
X-Gm-Message-State: AOJu0YwW3PREfIz1uI0y6nP17z5SBPKSvFCy3rXEQ7h/kcKyvS7IfSJK
 HxyjTheY6aoSrKHtKip4ZBNaJZmLE2uS+uFIBLL1K/mv/OKf595ufW0l4qT3g8S/uyshWkyFqf5
 PlaKQQJDvCuzSPtEP+YXcylnU1CESXhT4oyKSU2rF6u3UxbumDGKJa58=
X-Gm-Gg: AY/fxX59Fet26hhKxabzgNnCHdi04WQeD9S9DT0KtmDURwOG2beeoRGzaPszbXdBjjk
 4lbpdBVFLsFZ0QjFUtmLgjmmr9AXHYHvDY+WG5rtfRINczxq8a+wNjGr3uuMpVsWK+HmkWzUdeH
 TqUIm34PwNSbrTz9CYOjsV5HIHpF6h1eE2kXPRslHFIspmmPNLaUSUPsnDon+8KUxWXwMf3hYTQ
 3nHI/Ztou39saL6bxus/HqsjF+UdVD4+wMOikFOa4NsPafP+6eor3zOHHHPzl4wRwF6vfS+svKv
 S5zD74UsK0/OZQz3sEBxwifq6coR9JVMYL56Hm9Bo/k0w2ykcpBwbfF1YxFTaOqPTJGHYKVwTeh
 Stl8ScPVImLjHYhuDAbG6KDO8GCqFEGErSpIk5TC2T11Bd+1yvBt68eH3fpwxIcy4ZJLtofhAD4
 SimsqpB+OC4JNW4q0=
X-Received: by 2002:a05:600c:444a:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-47a8f1c20e1mr95104505e9.11.1765785021241; 
 Sun, 14 Dec 2025 23:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSi3cGxhN7llzfl7EE+mi08VkIniHymThWSLQFh2kluklyUzbcMleDmeBHzbbDlZgxLo37Lw==
X-Received: by 2002:a05:600c:444a:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-47a8f1c20e1mr95104345e9.11.1765785020804; 
 Sun, 14 Dec 2025 23:50:20 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4b6e43sm65092205e9.2.2025.12.14.23.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 07/11] meson: let Meson handle mixed-language linking of Rust
 and C objects
Date: Mon, 15 Dec 2025 08:49:56 +0100
Message-ID: <20251215075000.335043-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ClORCaoM8Tj-Gj7WKJ-WGNx-unYfTTXPG_qHhp34zLI_1765785021
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

With the bump to Meson 1.10.0, C objects can be passed to rust targets.
This way, the Rust libstd will be added by rustc itself in its final
linker invocation.  Use that to eliminate the staticlib and allow
dynamic linking with libstd (also introduced by Meson 1.9.0, but not
for staticlib crates due to lack of support in rustc).

The main() function is still provided by C, which is possible by
declaring the main source file of the Rust executable (which is
still created by scripts/rust/rust_root_crate.sh) as #![no_main].

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                     | 19 ++++++++-----------
 scripts/rust/rust_root_crate.sh |  1 +
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index e2de3832ac3..3790cf15f51 100644
--- a/meson.build
+++ b/meson.build
@@ -4352,25 +4352,22 @@ foreach target : target_dirs
   arch_srcs += target_specific.sources()
   arch_deps += target_specific.dependencies()
 
+  main_rs = []
+  crates = []
   if have_rust and target_type == 'system'
     target_rust = rust_devices_ss.apply(config_target, strict: false)
-    crates = []
+    arch_deps += target_rust.dependencies()
     foreach dep : target_rust.dependencies()
       crates += dep.get_variable('crate')
     endforeach
     if crates.length() > 0
-      rlib_rs = custom_target('rust_' + target.underscorify() + '.rs',
+      main_rs = custom_target('rust_' + target.underscorify() + '.rs',
                               output: 'rust_' + target.underscorify() + '.rs',
                               command: [rust_root_crate, crates],
                               capture: true,
                               build_by_default: true,
                               build_always_stale: true)
-      rlib = static_library('rust_' + target.underscorify(),
-                            structured_sources([], {'.': rlib_rs}),
-                            dependencies: target_rust.dependencies(),
-                            override_options: ['rust_std=2021', 'build.rust_std=2021'],
-                            rust_abi: 'c')
-      arch_deps += declare_dependency(link_whole: [rlib])
+      main_rs = structured_sources(main_rs)
     endif
   endif
 
@@ -4394,14 +4391,14 @@ foreach target : target_dirs
     execs = [{
       'name': 'qemu-system-' + target_name,
       'win_subsystem': 'console',
-      'sources': files('system/main.c'),
+      'sources': [main_rs, files('system/main.c')],
       'dependencies': [sdl]
     }]
     if host_os == 'windows' and (sdl.found() or gtk.found())
       execs += [{
         'name': 'qemu-system-' + target_name + 'w',
         'win_subsystem': 'windows',
-        'sources': files('system/main.c'),
+        'sources': [main_rs, files('system/main.c')],
         'dependencies': [sdl]
       }]
     endif
@@ -4410,7 +4407,7 @@ foreach target : target_dirs
       execs += [{
         'name': 'qemu-fuzz-' + target_name,
         'win_subsystem': 'console',
-        'sources': specific_fuzz.sources(),
+        'sources': [main_rs, specific_fuzz.sources()],
         'dependencies': specific_fuzz.dependencies(),
       }]
     endif
diff --git a/scripts/rust/rust_root_crate.sh b/scripts/rust/rust_root_crate.sh
index f05b8d02108..13ef7c1be5d 100755
--- a/scripts/rust/rust_root_crate.sh
+++ b/scripts/rust/rust_root_crate.sh
@@ -6,6 +6,7 @@ cat <<EOF
 // @generated
 // This file is autogenerated by scripts/rust/rust_root_crate.sh
 
+#![no_main]
 EOF
 
 for crate in $*; do
-- 
2.52.0


