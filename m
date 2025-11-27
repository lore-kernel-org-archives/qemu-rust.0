Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C0ECFD2F6
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:22:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObwF-0007L8-Lh; Thu, 27 Nov 2025 08:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvr-0005gC-96
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvj-00028e-NC
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3KQ67zMHkLC6e0eL/mpugWGJ8PZCERDSAdDuM8oV1k=;
 b=iS3jt251DfSlvKLMLBwqmuAUo8HjqpCrYp4BYm7atjJlzblYR5dsBVLVu9lLQlVE9nSV7+
 lTy+R5ykdoQ1ymwuyhJddIQyIL1RMAcO7LeYsjXn8kHF+pyJhsjL5MH1zG4Ff58AOsPSTJ
 xy0lH4iQ03MC+4z1IL/MRLLZV5bJ8A0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-dYdAJEkxNYmjz1RHx8F9Ng-1; Thu, 27 Nov 2025 08:21:01 -0500
X-MC-Unique: dYdAJEkxNYmjz1RHx8F9Ng-1
X-Mimecast-MFC-AGG-ID: dYdAJEkxNYmjz1RHx8F9Ng_1764249660
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b7387d9bbb2so64041866b.0
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249660; x=1764854460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v3KQ67zMHkLC6e0eL/mpugWGJ8PZCERDSAdDuM8oV1k=;
 b=tNaWWMuAw4w3b4aF+sqej7Ns9O5WxmnBZyW7OWsLVd+0HC95Jo1PiwN68R+qPeApFg
 u5/Ph4mJuXB3HgeQ0p/k56PZgTXGqjxiYQ3aUstsnjfDt6oMpxhGhOoOWLwlRAQQYUai
 6i4+iOx9KgFqhNxOBhGzsadeJEo0l+M5YXAKUhiRHw0M8h99l5OnkFm/DjkPKPMhOENB
 ISJGR1oRELhOQiqAMl0MzyIagltwVYZAKvWmmnb4/xaXU9m821zstT2C2Pp9hhlb4H+S
 q+snJ7t07T1leplNTYMvRt1xo9OqBcdpfGy2GgJJxMnPgOeprrHJOtListVLkDkPGTN0
 jhBg==
X-Gm-Message-State: AOJu0Yx0OypPlo63zQxWwGbl2ol8+T4/UoQASBHYMB2ON5hvmp+Lbg+K
 E4h+/yU4rLYUyQBVAG9dcVqdPqXt0oT4otET/DVUWnZnjAFUrEHVRZ/xudos87pYGQ7JliWl9Ek
 8GJu+viFpX64hYPVE2X3jWbvyrCKOrqWuAYbapR7kPxu9knuWxNM0LTFDubuFwGo=
X-Gm-Gg: ASbGncvTtsFnh6iSgQP8Z2Lo+B2Vj5ccwJ5C75MoIUVoySRIvTo9aOgslTEh5SCo9xx
 0pt5pp93GJBf0hg//kpgSVBhUgjW49/SZUpGHzAmbk/q2L+MCMCWDwdREW70FYrNFwy8TSOFrCv
 G2h14zgGoLLrFfrdyJWvn6+gTyCkWDu4BvcGlNSSqYzz8+f9vuZkX+uGr+FBVyU/4yIWKtcdLux
 tb49s1s4HrDlq4xlK74VFlprHyKGNhGOHnkqFbXpMAkNIL92qKWt2bYYGk0h2dYjBCXR2b7tZ/i
 eODLSUDF6N6BJ0hLW0SBJp+ekmqTCzRpqljvaCDiWnmmEx1naEq/fG8ksll3RrZIG9kEkd0ZgtA
 eBs2q/xXiC7e4a1yVwZ/sEspc6/vqNiIW1Eu73XapxfEc1OcaPPqLwppao+8RnOeUuyhNAX8Qaq
 SyxZmPskaGZSASC24=
X-Received: by 2002:a17:907:a08a:b0:b73:6b85:1a9a with SMTP id
 a640c23a62f3a-b76c53c3047mr1130346066b.21.1764249659805; 
 Thu, 27 Nov 2025 05:20:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+dX20BcpzNt6Shwzf6B0ooNdSdSBgJcc/1t4wum4wd8ZO1guQS4/LbUufQfIfuqAidBX6hA==
X-Received: by 2002:a17:907:a08a:b0:b73:6b85:1a9a with SMTP id
 a640c23a62f3a-b76c53c3047mr1130341366b.21.1764249659326; 
 Thu, 27 Nov 2025 05:20:59 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5162bb6sm166980166b.12.2025.11.27.05.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 9/9] rust: only link the Rust part of the code into devices
Date: Thu, 27 Nov 2025 14:20:36 +0100
Message-ID: <20251127132036.84384-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127132036.84384-1-pbonzini@redhat.com>
References: <20251127132036.84384-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UmCsDprXMfoiA_5wL7h2_TzxAX4PSkeK0LDfkPnKJPc_1764249660
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

Do not include libqemuutil in the device crates for the same
reason as in the previous commit.  Static libraries like qemuutil
are sensitive to their position on the command line and rustc does not
always get it right.

If rustc places the library too early on the command line, the stubs
are included in the final link product, which results in duplicate
symbols.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/meson.build | 18 ++++++++++--------
 rust/hw/timer/hpet/meson.build | 16 ++++++++--------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/rust/hw/char/pl011/meson.build b/rust/hw/char/pl011/meson.build
index 33b91f21911..9c0e8290e9a 100644
--- a/rust/hw/char/pl011/meson.build
+++ b/rust/hw/char/pl011/meson.build
@@ -28,20 +28,22 @@ _libpl011_rs = static_library(
   ),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
+  link_with: [
+    _util_rs,
+    _migration_rs,
+    _bql_rs,
+    _qom_rs,
+    _chardev_rs,
+    _system_rs,
+    _hwcore_rs,
+    _trace_rs
+  ],
   dependencies: [
     bilge_rs,
     bilge_impl_rs,
     bits_rs,
     common_rs,
     glib_sys_rs,
-    util_rs,
-    migration_rs,
-    bql_rs,
-    qom_rs,
-    chardev_rs,
-    system_rs,
-    hwcore_rs,
-    trace_rs
   ],
 )
 
diff --git a/rust/hw/timer/hpet/meson.build b/rust/hw/timer/hpet/meson.build
index bb64b96672e..7eb758ae347 100644
--- a/rust/hw/timer/hpet/meson.build
+++ b/rust/hw/timer/hpet/meson.build
@@ -3,15 +3,15 @@ _libhpet_rs = static_library(
   files('src/lib.rs'),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
-  dependencies: [
-    common_rs,
-    util_rs,
-    migration_rs,
-    bql_rs,
-    qom_rs,
-    system_rs,
-    hwcore_rs,
+  link_with: [
+    _util_rs,
+    _migration_rs,
+    _bql_rs,
+    _qom_rs,
+    _system_rs,
+    _hwcore_rs,
   ],
+  dependencies: [common_rs],
 )
 
 rust_devices_ss.add(when: 'CONFIG_X_HPET_RUST', if_true: [declare_dependency(
-- 
2.51.1


