Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E623D41D74
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3Lj-0000ds-U8; Mon, 15 Dec 2025 02:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LZ-0000bJ-BW
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LX-0000mG-PC
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPzOYGOdSS2nqdUVmE3Appt8FioAsNxMPjypO5wkIkE=;
 b=KvkEpXyMrJIT7CTyJ/fU1tPy91EAsn5h8susXSNBSr7Z2K2B/G5HKESGslSkZVH4JwZ9gW
 mKRtC5wtCsyGEzDnggaifJ/yiG4IdNDHlLSkQD/WXxn37oaxDnvZvx44JyQJVJ0tzNFAlD
 3CqMcM4emINRZse2Gah1EnzAYZ5ARQA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-nafcANRuOLuvOVBMbx0jPw-1; Mon, 15 Dec 2025 02:50:17 -0500
X-MC-Unique: nafcANRuOLuvOVBMbx0jPw-1
X-Mimecast-MFC-AGG-ID: nafcANRuOLuvOVBMbx0jPw_1765785016
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b2ad29140so1490159f8f.0
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785016; x=1766389816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DPzOYGOdSS2nqdUVmE3Appt8FioAsNxMPjypO5wkIkE=;
 b=ekTr+1f/FrB+1AVFhizVWfa5ODxMUlSsmQs63OByGVVmII5x6//iP6p194q0D4rODS
 5uS/SkmI+qs5F2lZonO1bxNvFnc3oCCt1ip7i77KII2wwYlXrB6K3GriMtmPmaOCWqkv
 mTVJCsMq8M2BYaRMOrrvyvChUhL5i0Proi7eik5M7MgBhilzOrVjQXgnwniiaKdQqCPA
 c4Y5GmBiaqsed3V/1sDF/qtS3PQLcSWONCoYYrjOnj+8tDx4R9pLYrrpCt9Mg8/nx8IQ
 QMZiLjcAPy3bAMs5HlupaRIAYykK8hTGh1pQcmes6SmdToATusOHYMcgfzNRipIVNb5H
 Cyzg==
X-Gm-Message-State: AOJu0YwgrRt8P6me5SEi8DAgvPPwSUHNTjEt3Aopag5vxnkM5hZdiFKZ
 ELh+uCBlRJYiZH8wl1eq5wXUmGVRb02r9pS4IUhohLpHPqmEvbZVUmOcg3WRe7t5I9tEG3bD+lS
 e/Rg27J6gaGes+fPhsfdIjiiIaElfkjDfrDw+F0ajCmeAyM0R6iAZ51g=
X-Gm-Gg: AY/fxX5CW7MBtC7xMD0had5GgdB0X0RI+aMX9yRCV9RUW3SS7eNhXZJprBe3ad/9TOQ
 ZCE/1Kh8eesJQObN+wVBOXhPW0Wa/4FG2Md+Ze+Hhs4IJlmIR2BjgzpP6jr9kBgHyaA8xNlqoPq
 agLkwPa56cdi4ZQLIA5mg2IGzlB5oFd3JMdPQGwckeKFUoLEYQTH3neD2l6X0IxeQAWZaoq+54W
 7cjtl5Qa+qSwPI9zJkKT3pu4L5BsMYXFA+6h/pJAUsRgXDDiXckpHE30fmNpYAYMdzQqHANJG8i
 UmyvY6vWK2sGUv5y8jVlve4sbL/8XCEGTCuI+5pk7pjHqgPRKH7UzNk+EpUM8pVXu9ei/N0xZ5p
 eWONq9yky0TZxpUgn9eOd0b7Hwm7ZECmPB7dF3KG0qnVqmrzORhBB01FI+Td9rACbR+0VuCd8UX
 bv8/8a3P/hxnP7qxY=
X-Received: by 2002:a5d:5f91:0:b0:431:53:1f49 with SMTP id
 ffacd0b85a97d-431005325c2mr859099f8f.41.1765785016205; 
 Sun, 14 Dec 2025 23:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVf+fWNJzbUzqsCwn5/tL5jAU1Nzlfoy2ugnNqNplrJxc7rJ26wxp+hA28DEWucIkVMS2sQQ==
X-Received: by 2002:a5d:5f91:0:b0:431:53:1f49 with SMTP id
 ffacd0b85a97d-431005325c2mr859076f8f.41.1765785015766; 
 Sun, 14 Dec 2025 23:50:15 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f268d459sm12450206f8f.32.2025.12.14.23.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 05/11] rust: only link the Rust part of the code into devices
Date: Mon, 15 Dec 2025 08:49:54 +0100
Message-ID: <20251215075000.335043-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215075000.335043-1-pbonzini@redhat.com>
References: <20251215075000.335043-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pj-F9eLNBl_7jvu9-pKdsbBmywr3rDS_b_a23v0ISK4_1765785016
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
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
 rust/hw/timer/hpet/meson.build | 18 +++++++++---------
 2 files changed, 19 insertions(+), 17 deletions(-)

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
index 9a3dd62caa3..3bb7ce2a6ca 100644
--- a/rust/hw/timer/hpet/meson.build
+++ b/rust/hw/timer/hpet/meson.build
@@ -3,16 +3,16 @@ _libhpet_rs = static_library(
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
-    trace_rs,
+  link_with: [
+    _util_rs,
+    _migration_rs,
+    _bql_rs,
+    _qom_rs,
+    _system_rs,
+    _hwcore_rs,
+    _trace_rs,
   ],
+  dependencies: [common_rs],
 )
 
 rust_devices_ss.add(when: 'CONFIG_X_HPET_RUST', if_true: [declare_dependency(
-- 
2.52.0


