Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FAFCEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttj-0003YH-FM; Mon, 17 Nov 2025 02:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtsx-0003Rk-OT
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtsw-0005uv-2L
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXWNBS5VhaBDKMLiYRt/qNQXMDrMpUmP4CgRsLrhNMs=;
 b=UmIttLuD/ZtDssCzfn3Ozwq3+jLXel2xfUkEWlqrjXUu+kaeL10jg5BMrY00yw39KajTIN
 LWOCcy56n0WNLiRHuEH1PyfTTnWeL128D1oiMTBsmDolsQa7pzRUr3cmn03TqGVZL5p+Pv
 qg5w07e7Z48ao+LINrfPjDb9zuvnTWY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-KVr6UufRNfW-u2FK4vD-9A-1; Mon, 17 Nov 2025 02:42:48 -0500
X-MC-Unique: KVr6UufRNfW-u2FK4vD-9A-1
X-Mimecast-MFC-AGG-ID: KVr6UufRNfW-u2FK4vD-9A_1763365367
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42b30184be7so1711176f8f.2
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365366; x=1763970166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WXWNBS5VhaBDKMLiYRt/qNQXMDrMpUmP4CgRsLrhNMs=;
 b=GaL+iDGrIs/vQpskJJ2oRpj68vWK9xw6Ub/Phy/9XVLUHbzkQhY/K9mDf+QExT7TA/
 /IjtvCAL88ko3Mo+7drgqLQzjqzb5+MZWoczWSrYYKdrZlFNw+61upWFH/YhWpr1+87N
 hW+V4KksZZFCEy3Fs4eFDs3IUvrEPu15gpLKlPdr7N9MiWk4/vDFcTKusdlUmP84hxqg
 k+wS0VUw8EN6VyUWsGARY2p3SgxD1tnXdXkwYLcQB03/6wNWyaleuLrtHNM+55VBA0F0
 XiGdi1aYRlqg+LL8/ZgBNaU7wvF/5LUAqeWxhlm0U/rIFY1T8Ak1/aBk2LdorLeObVTD
 PQrg==
X-Gm-Message-State: AOJu0Yxt4ymBUpS4ubxkkYShZhNs9HYRXXXSjMNQyLT9YEcdaG40KSum
 +xf7a+xy9WYDZjR/FTtEGaEPof8VRtjuqvhO9G7Pq2il3tMO+GQv71iODN0UOFGQlZzPOmz6MJz
 ML3rCKJID87F0WAxeia3QYGPUhEEzm7fhfnwO1++2up2djMLqyF02zpdn2BD63Ls=
X-Gm-Gg: ASbGncuU5kZSaRkcECDZYZlXWWCqwU3x4BS+1f2hPAL+kDbh6jkD1cxlaKGar0L7U91
 YJgrxzxxe4UpbdE99n81KJzTAymA1nV99G4csJUTv7TcoJc+9qT+YhJD50LzDutNc1KG76nLDQZ
 nCdPqM+u2lUhSkZKaKUvS8Sb/36Vu7/cXRSBslAdqS8UkJJOjHcIAN7eT7xEkUR/qKkiIKA6BCD
 h/Hx+b3BJCk5ZYG7OwlFWIFwMW7xGVpy6wry1ev6yjOWGXqCdvog7NG/vQxp4fEpSXKXRon0xRD
 i+HEvc1dX6lMr9nGDYRJ1olxoRbwe2YrRdITFtJj9DWZYclWplwxj0qAwYkX5FjhM7Eam6Oe6im
 kWqg0AtBhBBF+y0Y68ht/61Owe+tTKs7Mx9uBkRWHSC+3Y6XCprk8Ij9uLmFFdtZVgiESYPzuDh
 xYJT4T
X-Received: by 2002:a5d:584e:0:b0:42b:3cd2:e9bb with SMTP id
 ffacd0b85a97d-42b5936c3dbmr10875002f8f.32.1763365366358; 
 Sun, 16 Nov 2025 23:42:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgORTIIi371fjt9Hr2AMNjaMxZheQOLEx6qGofV9948hnrMsOWalG76zVd2wtQ7zmbDeALqA==
X-Received: by 2002:a5d:584e:0:b0:42b:3cd2:e9bb with SMTP id
 ffacd0b85a97d-42b5936c3dbmr10874984f8f.32.1763365365876; 
 Sun, 16 Nov 2025 23:42:45 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae47sm24204521f8f.4.2025.11.16.23.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/8] common: add prelude
Date: Mon, 17 Nov 2025 08:42:32 +0100
Message-ID: <20251117074239.190424-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7vOyxh7T5JF3HwH4KYmJwB9ACOsS5qu23HpMAyeMfy8_1763365367
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/common/meson.build          | 13 +------------
 rust/common/src/lib.rs           |  5 +++++
 rust/common/src/prelude.rs       |  9 +++++++++
 rust/hw/char/pl011/src/device.rs |  2 +-
 rust/hw/timer/hpet/src/device.rs |  2 +-
 5 files changed, 17 insertions(+), 14 deletions(-)
 create mode 100644 rust/common/src/prelude.rs

diff --git a/rust/common/meson.build b/rust/common/meson.build
index aff601d1df2..db1365dbe0d 100644
--- a/rust/common/meson.build
+++ b/rust/common/meson.build
@@ -4,18 +4,7 @@ _common_cfg = run_command(rustc_args,
 
 _common_rs = static_library(
   'common',
-  structured_sources(
-    [
-      'src/lib.rs',
-      'src/assertions.rs',
-      'src/bitops.rs',
-      'src/callbacks.rs',
-      'src/errno.rs',
-      'src/opaque.rs',
-      'src/uninit.rs',
-      'src/zeroable.rs',
-    ],
-  ),
+  'src/lib.rs',
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   rust_args: _common_cfg,
diff --git a/rust/common/src/lib.rs b/rust/common/src/lib.rs
index 8311bf945da..6093d01a388 100644
--- a/rust/common/src/lib.rs
+++ b/rust/common/src/lib.rs
@@ -15,6 +15,11 @@
 pub mod opaque;
 pub use opaque::{Opaque, Wrapper};
 
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
+
 pub mod uninit;
 pub use uninit::MaybeUninitField;
 
diff --git a/rust/common/src/prelude.rs b/rust/common/src/prelude.rs
new file mode 100644
index 00000000000..7d38ea12055
--- /dev/null
+++ b/rust/common/src/prelude.rs
@@ -0,0 +1,9 @@
+//! Essential types and traits intended for blanket imports.
+
+pub use crate::bitops::IntegerExt;
+pub use crate::uninit::MaybeUninitField;
+
+// Re-export commonly used macros
+pub use crate::static_assert;
+pub use crate::uninit_field_mut;
+pub use qemu_macros::TryInto;
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 18f40fdc58b..b7e8e393d2e 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -6,7 +6,7 @@
 
 use bql::BqlRefCell;
 use chardev::{CharFrontend, Chardev, Event};
-use common::{static_assert, uninit_field_mut};
+use common::prelude::*;
 use hwcore::{
     Clock, ClockEvent, DeviceImpl, DeviceMethods, DeviceState, IRQState, InterruptSource,
     ResetType, ResettablePhasesImpl, SysBusDevice, SysBusDeviceImpl, SysBusDeviceMethods,
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 6e9c004ecae..e9c7afa24d5 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -11,7 +11,7 @@
 };
 
 use bql::{BqlCell, BqlRefCell};
-use common::{bitops::IntegerExt, uninit_field_mut};
+use common::prelude::*;
 use hwcore::{
     DeviceImpl, DeviceMethods, DeviceState, InterruptSource, ResetType, ResettablePhasesImpl,
     SysBusDevice, SysBusDeviceImpl, SysBusDeviceMethods,
-- 
2.51.1


