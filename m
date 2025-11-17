Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE0CEBF92
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttl-0003a4-Fy; Mon, 17 Nov 2025 02:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKttA-0003Sw-3e
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtt7-0005xD-Jv
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S14Zo44EQMwZqqZohNEqtSrNdlsFQNx9pJq4LX6ET20=;
 b=WlqccdE53KeskqqnxCSjaiCiaw41Ja0z78xsgn/RHZ/TJTTmiiDMde5L3t/DbVtuh69qE7
 MZtsYHxDhfsivgKnnTpKUe1+51aD5+La2FxfI+TcfMIAAzI1oh4COanYeI/9LxO2emZ812
 LvhBpnWrWH0CRZ49BHKveGx2Wg549Is=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-bBT5IyPFPKaR5EB8LsSiZQ-1; Mon, 17 Nov 2025 02:42:59 -0500
X-MC-Unique: bBT5IyPFPKaR5EB8LsSiZQ-1
X-Mimecast-MFC-AGG-ID: bBT5IyPFPKaR5EB8LsSiZQ_1763365378
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b2e448bd9so2555883f8f.1
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365378; x=1763970178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S14Zo44EQMwZqqZohNEqtSrNdlsFQNx9pJq4LX6ET20=;
 b=fy6fv2om0DDwZuvam4YoyE/BZPAdrQpT9W0iXSkwjaBVg3IEmgP4yR+p4x1I4v3D+f
 UbVcRscioNtKW5peakRqJ0ZmVtrlkdq7UwUfYiIVAbFZDrQYvmiVQFA5fDd0vLfBT3LL
 EWU8AJyiu2Y+ZuOrcYwXHAMRQumTS4nFg8rU2W7ERgWYjnmJoa1oR1OGR9v5tclbPHpX
 sMIpy1qhhGC+AZ+hoRUL0oMVb0sa/Brt++O7gTTmkcoHIG9yaO0fDBCj9A2kKI412xAO
 5ygI7B5wPfi6Y5ycH710NZk53EzBO/Tf6tgLoQCOxdmYd+bTtMTepmDVE5NPJ1lYpfI1
 eeTQ==
X-Gm-Message-State: AOJu0YxONVnFFjtSYorc+K3CDZYO1DpJYmDwY88fMTuA69Q0q6Q+H6L2
 Edd4T7byrPK0fTDo2KnXiMbPGsiMJljyDbWsXic9DS87bAlTrsKvvVuN02DZ6HG8/qeKO115268
 QgZqnRKvPZH/sojJqIEllosCunM6+8mj7NlAzvAAM52ivbOjdG1nsQq4J9brPkwY=
X-Gm-Gg: ASbGncvv/RIptqky5h+8bZynRK2EDx2Oy1EKJ6KziiuZzAEuA8RFi9Kh3RYY48yvXx+
 dQuutZgpAqD1NU5gj/kss3AQVio610rh3vmm75yEflmyzxns8xYMDtQ0f1u8tbq3yRqUqTsN30y
 xOUIAOAqprZIFtggh7a+8TDgaPt+aVo8dg2PVo715BWt5hiStgs7ZiwKlUVsDki7jomzB52T8/v
 ubzSqXnwyvgt4g7kJWqDV1f1h+WXqrflE4oQaW8bvgl3sguy7a1smHouvVnR6SIzGTVGMznwlzd
 1i2UfB+ZNNy0GrgNyjUNKQXE9Ggkyqi61yU9xvZ6NeClgYzoM8GFhQ8RYXCn6gjwv+JCos7DX0f
 I0FPGWfwPJvCNg8lvTncBd8Ct0vQ6QbvDZNQHwdPaWA+hCYtt3uisDfDkJ+TLkFPopBU88dAbSp
 kygGIe
X-Received: by 2002:a05:6000:1849:b0:3e7:45c7:828e with SMTP id
 ffacd0b85a97d-42b59385bcemr10641341f8f.33.1763365377720; 
 Sun, 16 Nov 2025 23:42:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE38zZInzdapEkJdUv3e6VVXFW01Gnj8qybY3ivmSyNdEyYireH9aeebVHim+VB9yoQdUAvxA==
X-Received: by 2002:a05:6000:1849:b0:3e7:45c7:828e with SMTP id
 ffacd0b85a97d-42b59385bcemr10641325f8f.33.1763365377306; 
 Sun, 16 Nov 2025 23:42:57 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e85cc0sm25527950f8f.17.2025.11.16.23.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 7/8] system: add prelude
Date: Mon, 17 Nov 2025 08:42:37 +0100
Message-ID: <20251117074239.190424-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 85UNsIWn7vJRwhMFic_Dt6D7nEM_hGk_yYGFAsM07kw_1763365378
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 rust/hw/timer/hpet/src/device.rs | 5 +++--
 rust/system/meson.build          | 1 +
 rust/system/src/lib.rs           | 5 +++++
 rust/system/src/prelude.rs       | 8 ++++++++
 5 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 rust/system/src/prelude.rs

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index be1bdf5ab12..0b1bb2d5a3b 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -10,7 +10,7 @@
 use hwcore::{prelude::*, ClockEvent, IRQState};
 use migration::{self, prelude::*};
 use qom::{prelude::*, ObjectImpl, Owned, ParentField, ParentInit};
-use system::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder};
+use system::prelude::*;
 use util::prelude::*;
 
 use crate::registers::{self, Interrupt, RegisterOffset};
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index b7153a46e31..c5cdb87b073 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -16,8 +16,9 @@
 use migration::{self, prelude::*};
 use qom::{prelude::*, ObjectImpl, ParentField, ParentInit};
 use system::{
-    bindings::{address_space_memory, address_space_stl_le, hwaddr},
-    MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder, MEMTXATTRS_UNSPECIFIED,
+    bindings::{address_space_memory, address_space_stl_le},
+    MEMTXATTRS_UNSPECIFIED,
+    prelude::*,
 };
 use util::prelude::*;
 
diff --git a/rust/system/meson.build b/rust/system/meson.build
index 73d61991146..6624fa6cee5 100644
--- a/rust/system/meson.build
+++ b/rust/system/meson.build
@@ -30,6 +30,7 @@ _system_rs = static_library(
       'src/lib.rs',
       'src/bindings.rs',
       'src/memory.rs',
+      'src/prelude.rs',
     ],
     {'.': _system_bindings_inc_rs}
   ),
diff --git a/rust/system/src/lib.rs b/rust/system/src/lib.rs
index aafe9a866c9..5fb83b65d8d 100644
--- a/rust/system/src/lib.rs
+++ b/rust/system/src/lib.rs
@@ -4,3 +4,8 @@
 
 mod memory;
 pub use memory::*;
+
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
diff --git a/rust/system/src/prelude.rs b/rust/system/src/prelude.rs
new file mode 100644
index 00000000000..2d98524c36e
--- /dev/null
+++ b/rust/system/src/prelude.rs
@@ -0,0 +1,8 @@
+//! Essential types and traits intended for blanket imports.
+
+// Core memory types
+pub use crate::memory::hwaddr;
+pub use crate::memory::MemoryRegion;
+pub use crate::memory::MemoryRegionOps;
+pub use crate::memory::MemoryRegionOpsBuilder;
+pub use crate::memory::MemTxAttrs;
-- 
2.51.1


