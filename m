Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D75BCAC5BB
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 07:49:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3ras-0003Xz-0y; Wed, 01 Oct 2025 03:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3ran-0003XV-PK
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 03:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3raj-00022E-0J
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 03:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759304968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+a3SkOF45yE4vyVlAzQd9o/NhWWYLj+iXonbBYLEkA=;
 b=Dm46dqWp7mENNdidn5DxpYzrgk86SXWRj/wEz6jxZX5ZLIRKxtjZt3x9AWPmDwPOas3aWr
 wk/odEmzJMrRXAM6YRUfFpnB0XiGiS2YdjlRQTd7lTqm3Sr0F6u4KWvfBwkqhhhhc73oMP
 ll4BQ1xmJBPOt3n4Ews1bZ9k7D9hfxU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-27JHAC71PPSrm7tQ4ggD8w-1; Wed, 01 Oct 2025 03:49:26 -0400
X-MC-Unique: 27JHAC71PPSrm7tQ4ggD8w-1
X-Mimecast-MFC-AGG-ID: 27JHAC71PPSrm7tQ4ggD8w_1759304965
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b3f2cfc26edso86150866b.2
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 00:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759304965; x=1759909765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+a3SkOF45yE4vyVlAzQd9o/NhWWYLj+iXonbBYLEkA=;
 b=q6tlEOnrHNMJSpLgD1HA5+CDBUGCxlQYdQHuDM8NoVtmV1AC2Nwl8mVy21gpfb7DYh
 8ykZc/bL8mvqmnU6S/z+kIWzJqmqYkXl9x9O9F4Lu1ciXjIzF3PvPJtJVYYUkNvrSITw
 LX3iMiDp+KwEfewz1kv9e6JOeFmZ3xN6ErU1MdQaW0X57om1AdQPSL9kCgajWMD81ccR
 Km0R48TgfNS16mlt24gz6bsNDcogK8vc4ig+K90yWWwxM7YF8Hr+85JS18HjwmJ5m7S6
 8S+ITaldR+uR9FsSYROFMC9Dm9MxgW6wnsZmEJ4UFIV4lup3NjT/rdfq2ColPlkJHYPg
 ZiSQ==
X-Gm-Message-State: AOJu0YwIkhJ4AXTcX2hOOwsoTMPGH6Cx2eyKEx0PgdKVDAH0ylSNacQI
 ysRIT3cThhKrsqpojx6UInKM6D4R7XiINMBORWrlJs+Ji4EMF7z2mEhFXRX5rwQJ23YSOYBm5ft
 1uDqdgCDb2zI8xEVXi8+QmR0+OMuCb7NkP/gdDJYR13bkHq7xoklVfFs=
X-Gm-Gg: ASbGncuYz+a2lrW5UlqXplMPEXQg7sh19jhViXcLT4LsOIB1w99oaS/tS9RjCYrPzKG
 aDbxHzrSK+YZYpb+yXicsnFFaCqyRMaMKIQ24yEKMuOY0tMFKhNu8IRg+OEp+2eKJh/U+nbSPPk
 Dw90avvV0qLYFVBxKNmLKsqiYPkmj3dYdUxb7v/Rq4xUjtepxONRvQvqbASIaQjue9P08qfVVdg
 W4a2RT0vJPbtC1hEFm594dfOKrZTLVo+wJ7w/iKTuLJ2TDVuvkeRiGdCXEwe2Lu+uZpaWZjijUk
 BaNgULsTIfIy5fuDLdmOXRgQrmuVAsDnaLaQaQlQhiNz5Px4uZX5ih8jw6l/wCyRJfQTnufO6gH
 HPEu5ylvnl+Sczb6wE/m2C/KuGVJPQY8XcDGVOWFtC+0hEMgHYoc=
X-Received: by 2002:a17:907:948a:b0:b41:297c:f7bb with SMTP id
 a640c23a62f3a-b46e5d3b644mr280967466b.26.1759304965181; 
 Wed, 01 Oct 2025 00:49:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9eh0Y9KEwi+78oQ6L4wKLXfLinoboNrDsysQ8eu2Vb/VARWmjefkGL9XfDfMLcZ5zCaJjqA==
X-Received: by 2002:a17:907:948a:b0:b41:297c:f7bb with SMTP id
 a640c23a62f3a-b46e5d3b644mr280965166b.26.1759304964716; 
 Wed, 01 Oct 2025 00:49:24 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3629badsm10969666a12.9.2025.10.01.00.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:49:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 1/2] subprojects: add glib-sys-rs
Date: Wed,  1 Oct 2025 09:49:19 +0200
Message-ID: <20251001074920.1041619-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001074920.1041619-1-pbonzini@redhat.com>
References: <20251001074920.1041619-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pl8FV2w-iXNLLD241GuOOmRoiz97chT_FnO4SdSIZkU_1759304965
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/meson.build                              |  2 ++
 scripts/archive-source.sh                     |  1 +
 subprojects/.gitignore                        |  1 +
 subprojects/glib-sys-0.21-rs.wrap             |  7 ++++
 .../packagefiles/glib-sys-0.21-rs/meson.build | 33 +++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 subprojects/glib-sys-0.21-rs.wrap
 create mode 100644 subprojects/packagefiles/glib-sys-0.21-rs/meson.build

diff --git a/rust/meson.build b/rust/meson.build
index 7fd857215b0..76e10699b37 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -2,12 +2,14 @@ subproject('anyhow-1-rs', required: true)
 subproject('bilge-0.2-rs', required: true)
 subproject('bilge-impl-0.2-rs', required: true)
 subproject('foreign-0.3-rs', required: true)
+subproject('glib-sys-0.21-rs', required: true)
 subproject('libc-0.2-rs', required: true)
 
 anyhow_rs = dependency('anyhow-1-rs')
 bilge_rs = dependency('bilge-0.2-rs')
 bilge_impl_rs = dependency('bilge-impl-0.2-rs')
 foreign_rs = dependency('foreign-0.3-rs')
+glib_sys_rs = dependency('glib-sys-0.21-rs')
 libc_rs = dependency('libc-0.2-rs')
 
 subproject('proc-macro2-1-rs', required: true)
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index a725dd923dc..8f97b19a088 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -36,6 +36,7 @@ subprojects=(
   bilge-impl-0.2-rs
   either-1-rs
   foreign-0.3-rs
+  glib-sys-0.21-rs
   itertools-0.11-rs
   keycodemapdb
   libc-0.2-rs
diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index 0b5d9634094..c00c8478372 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -13,6 +13,7 @@
 /bilge-impl-*
 /either-*
 /foreign-*
+/glib-sys-*
 /itertools-*
 /libc-*
 /proc-macro-error-*
diff --git a/subprojects/glib-sys-0.21-rs.wrap b/subprojects/glib-sys-0.21-rs.wrap
new file mode 100644
index 00000000000..313ced731ac
--- /dev/null
+++ b/subprojects/glib-sys-0.21-rs.wrap
@@ -0,0 +1,7 @@
+[wrap-file]
+directory = glib-sys-0.21.2
+source_url = https://crates.io/api/v1/crates/glib-sys/0.21.2/download
+source_filename = glib-sys-0.21.2.tar.gz
+source_hash = d09d3d0fddf7239521674e57b0465dfbd844632fec54f059f7f56112e3f927e1
+#method = cargo
+patch_directory = glib-sys-0.21-rs
diff --git a/subprojects/packagefiles/glib-sys-0.21-rs/meson.build b/subprojects/packagefiles/glib-sys-0.21-rs/meson.build
new file mode 100644
index 00000000000..8c5483311ed
--- /dev/null
+++ b/subprojects/packagefiles/glib-sys-0.21-rs/meson.build
@@ -0,0 +1,33 @@
+project('glib-sys-0.21-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '0.21.2',
+  license: 'MIT',
+  default_options: [])
+
+subproject('libc-0.2-rs', required: true)
+libc_rs = dependency('libc-0.2-rs')
+
+_glib_sys_rs = static_library(
+  'glib_sys',
+  files('src/lib.rs'),
+  gnu_symbol_visibility: 'hidden',
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  rust_args: [
+    '--cap-lints', 'allow',
+    '--cfg', 'feature="v2_66"',
+    '--cfg', 'feature="v2_64"',
+    '--cfg', 'feature="v2_62"',
+    '--cfg', 'feature="v2_60"',
+    '--cfg', 'feature="v2_58"',
+  ],
+  # should also link with glib; don't bother doing it here since all
+  # QEMU targets have it
+  dependencies: [libc_rs],
+)
+
+glib_sys_dep = declare_dependency(
+  link_with: _glib_sys_rs,
+)
+
+meson.override_dependency('glib-sys-0.21-rs', glib_sys_dep)
-- 
2.51.0


