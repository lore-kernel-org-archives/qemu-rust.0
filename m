Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2950CEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKtto-0003kY-8i; Mon, 17 Nov 2025 02:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKttE-0003T8-86
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtt9-0005xl-S6
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=th72CWf8N6hC8gTVKCWu4vw/HAFw3p4qEKKo2Ddh4jA=;
 b=ZDe7zlQ764zdS8bnz729oxb5+Wkx+JRNWcPAhdElSXB3FKP3MrjE/nUzwN+hGdKCwZdNgy
 c5vP+qHfZGqvViMwJRq3zAWM5Kb6Kop85CGGx5LRPZgNUw05EFHyTIfcBKwms2sevZEpXb
 90MT1E5rNecNt45aiysv38E8d2aHddA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-nWeE_BWLPNqa1wdectZF8w-1; Mon, 17 Nov 2025 02:43:02 -0500
X-MC-Unique: nWeE_BWLPNqa1wdectZF8w-1
X-Mimecast-MFC-AGG-ID: nWeE_BWLPNqa1wdectZF8w_1763365381
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4779d8fd4ecso3463125e9.1
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365380; x=1763970180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=th72CWf8N6hC8gTVKCWu4vw/HAFw3p4qEKKo2Ddh4jA=;
 b=j1ovrHGf2aLAbRCmzB/fdhB2poN2M7iayPHC/2vSlqdZAevyL0yVf1/dFiCU7axh+X
 w4D2N46116XRwoblmYogFRSMgakg9YOdP6FgB/uH7vnZrOQlAzamloIunutD56Z1WVUT
 lvT/rBCtqNv6BQxoPr4EYKFzWM8y9JgMK4CvxHV2/B4BtkhTcNea9XExBZSzhLIwbjKE
 BnnRd33p8jspJnLYOxrHoDZFLcI19RCQ+PztgKYH2JSKbXdZcJeGpHsq7/Q1LCLGJDCQ
 paUPg9nWmEOkKCQdtI4VMsjm9kkgdoSIa3bGos6ZV2IICjEocEnhB6RhuG9lD/HA+vdi
 ckXg==
X-Gm-Message-State: AOJu0Yyy3bVJMvlo4VObj/uxWXuXMSjXt9DsoPOivXtFtHKpU+UunJas
 XvZuSJlYA70wByXZVk7CESzIydSuI2wyNBUytHvdxIRPIzO/GE5JNjaQi1md1h2z+S0hMUZm6ew
 8LkBblbahYz8CcvM3tXuOXZvMFm1mKt1o7UFnuuFXWTymSWH9rsQhLpsBxws5DJQ=
X-Gm-Gg: ASbGncus3X2T+xtdjXqEk45pJXZWqSu6SQ+bE7IK2/Mi4UU+oORMXysV5jQhkbzLy55
 738dkCxN8kn7cdJnaGlvsKnC7Y7B0uIto8upWO5X1C6PkpAB1m5v3Kunr1z2OMwO+xH5KcmOyaX
 MnARFirKYkb7DDvay8bgRJxAA2VZY3lzT9SfcD1EPW6Lt0IWrdbZc3g6ypVOX5iSCy4ym0Ooq3h
 uYeve01tpz8sSspUIpftj9KElXEGP3FgWKfp8KFOh6Av3gUv29ifFmA72mHg2sbe/mrXggj1wMJ
 OaZH4LwahFODWsKVABvr4t/z9pZDHu6wD6aHRz6K8zki45ifg9E32wmRRGOqf/Zg7hQjVofD2+W
 A998tS+v8ZjJcB9fvNDxOD/AHoE6262vspUKaZhscm2y2uBZinH60AmHBYwXZHkJ434VelR1sSm
 np7sax
X-Received: by 2002:a05:600c:1547:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-4778fd89eafmr113038835e9.8.1763365380280; 
 Sun, 16 Nov 2025 23:43:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpIl9xgDLkE383VAJ9ZhNOQsCX3Cwn09ubA5rCFcrH2yDYcieS1UXdz18gOFmU8/QqqozFiw==
X-Received: by 2002:a05:600c:1547:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-4778fd89eafmr113038675e9.8.1763365379878; 
 Sun, 16 Nov 2025 23:42:59 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779a2892c8sm118404145e9.1.2025.11.16.23.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 8/8] qom: add more to the prelude
Date: Mon, 17 Nov 2025 08:42:38 +0100
Message-ID: <20251117074239.190424-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z0hx36LKWDqQVqa7aIcRMWvSd58vgZVh8ErrgkaqJe0_1763365381
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
 rust/hw/char/pl011/src/device.rs | 2 +-
 rust/hw/core/src/qdev.rs         | 2 +-
 rust/hw/core/src/sysbus.rs       | 2 +-
 rust/hw/core/tests/tests.rs      | 2 +-
 rust/hw/timer/hpet/src/device.rs | 2 +-
 rust/qom/src/prelude.rs          | 4 ++++
 6 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 0b1bb2d5a3b..9f5c4a34df0 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -9,7 +9,7 @@
 use common::prelude::*;
 use hwcore::{prelude::*, ClockEvent, IRQState};
 use migration::{self, prelude::*};
-use qom::{prelude::*, ObjectImpl, Owned, ParentField, ParentInit};
+use qom::prelude::*;
 use system::prelude::*;
 use util::prelude::*;
 
diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
index 4e983da28b7..32370319871 100644
--- a/rust/hw/core/src/qdev.rs
+++ b/rust/hw/core/src/qdev.rs
@@ -12,7 +12,7 @@
 use chardev::Chardev;
 use common::{callbacks::FnCall, Opaque};
 use migration::{impl_vmstate_c_struct, VMStateDescription};
-use qom::{prelude::*, ObjectClass, ObjectImpl, Owned, ParentInit};
+use qom::{prelude::*, ObjectClass};
 use util::{Error, Result};
 
 pub use crate::bindings::{ClockEvent, DeviceClass, Property, ResetType};
diff --git a/rust/hw/core/src/sysbus.rs b/rust/hw/core/src/sysbus.rs
index 68165e89295..c7acf214559 100644
--- a/rust/hw/core/src/sysbus.rs
+++ b/rust/hw/core/src/sysbus.rs
@@ -8,7 +8,7 @@
 
 pub use bindings::SysBusDeviceClass;
 use common::Opaque;
-use qom::{prelude::*, Owned};
+use qom::prelude::*;
 use system::MemoryRegion;
 use util::{Error, Result};
 
diff --git a/rust/hw/core/tests/tests.rs b/rust/hw/core/tests/tests.rs
index e60c9d018f5..115dd7a860d 100644
--- a/rust/hw/core/tests/tests.rs
+++ b/rust/hw/core/tests/tests.rs
@@ -7,7 +7,7 @@
 use bql::prelude::*;
 use hwcore::prelude::*;
 use migration::prelude::*;
-use qom::{prelude::*, ObjectImpl, ParentField};
+use qom::prelude::*;
 use util::bindings::{module_call_init, module_init_type};
 
 // Test that macros can compile.
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index c5cdb87b073..c82b27ddf15 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -14,7 +14,7 @@
 use common::prelude::*;
 use hwcore::prelude::*;
 use migration::{self, prelude::*};
-use qom::{prelude::*, ObjectImpl, ParentField, ParentInit};
+use qom::prelude::*;
 use system::{
     bindings::{address_space_memory, address_space_stl_le},
     MEMTXATTRS_UNSPECIFIED,
diff --git a/rust/qom/src/prelude.rs b/rust/qom/src/prelude.rs
index 00a60959771..6a1ecaef2a7 100644
--- a/rust/qom/src/prelude.rs
+++ b/rust/qom/src/prelude.rs
@@ -6,7 +6,11 @@
 pub use crate::qom::ObjectCast;
 pub use crate::qom::ObjectClassMethods;
 pub use crate::qom::ObjectDeref;
+pub use crate::qom::ObjectImpl;
 pub use crate::qom::ObjectMethods;
 pub use crate::qom::ObjectType;
+pub use crate::qom::Owned;
+pub use crate::qom::ParentField;
+pub use crate::qom::ParentInit;
 
 pub use crate::qom_isa;
-- 
2.51.1


