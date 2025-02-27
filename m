Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnen7-0005RJ-V9
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tneme-0003rQ-BQ
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnema-00045r-SS
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpP0mKR1bYf8x/BopqJJucrB8oxIRdemZl6JUWYmoLk=;
 b=UjdMxkWrcPLQ8ZY1iDotcqFKPHC6VGnGOsYi8FKLIlpuLIgiC9e/xnF6Lzp0+7svc65+DF
 nVUQpW/xqU8RhYIaBeCkhqr9BNwnTcH1x/u0TsGJ/5kVCy3lNXimuLOcDQ6+62kcmv3T+Y
 Arf5HLPnuln07lDmgpqMFRQ6tpNzHm4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-FvnM9kavMMmnxPFAiEcayw-1; Thu, 27 Feb 2025 09:22:33 -0500
X-MC-Unique: FvnM9kavMMmnxPFAiEcayw-1
X-Mimecast-MFC-AGG-ID: FvnM9kavMMmnxPFAiEcayw_1740666153
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-abecbdb4272so119848666b.0
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666152; x=1741270952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpP0mKR1bYf8x/BopqJJucrB8oxIRdemZl6JUWYmoLk=;
 b=CqFQngun7Hzj9TefNZKRXcV+l8x+Yjx/P7zvF9ADsyUuSttIWXIPGJLebKvszC6v/J
 xw6vmjc/Z3FRTTExEiOmGNyjCqCv4VyGdceeE8QQ9OQ5TQF9ZM3GV/nlwMD1UEi5s98r
 RDSSvgMJlwO3K3AJ0d3V/Qnp7QDlsKeZLN1qxpXGGY6y3ZDs/ikFl630gdq0HXESH7E3
 VSu69fDrAlXUtqpiGW5coS09u1jLEoessMEu7LApcHmViE/X15DcJx8hiL3gw1tze3io
 Nyx0NZSY0uarzcfgtsoqc9adKpvV7KyS+u3SiCRDB0zjJGxYxh/pR8JFN4Tyl4qqBelm
 L/ww==
X-Gm-Message-State: AOJu0YzXE2FCOXn1fFCoagt4FK+EJYqONnbLv/RPgged2DZHqXShPpVQ
 6FwqOV+WRqC+41px8mrpOtbsW4umtYk9GMaTbKTQdtJ3SmY55zGPgBMaU+PUTY17tZ17m0YHvs7
 qIZli9CyNk81DTqpjvVzyc6eOFdE5KM81hUfiAlg5PvB+oQzgBsk=
X-Gm-Gg: ASbGnctoeaGlVXODeHOBEK4KFMJRw9b68km+eKIcj3Ht1W0PkG5BrgpQ/iMUN1iHIxk
 LG5AnbKb0EGDrd2sbPVqd00LFSG0gkUEYULXuI3CqT5Z1u4t3z1hdBm9LJiSswC8ZWqh9q+IfVS
 n1DZoykHEMPRVRb4qulxhO38j+A3DNGIMFBDb+8kH/hXWbBtUG55+8qJBOX7l82QjzjE9byAGwO
 2h8HWIM8J1FEQxOu1flluIPsl7nsMoXtybh7B9Cn8dnGoZl7hbLsgN2mlnEHE5b319J1r4X0ybl
 lOSbPIjxTLsyxTp3L+Zu
X-Received: by 2002:a17:907:9686:b0:ab7:d7fd:6250 with SMTP id
 a640c23a62f3a-abed1015488mr1399570866b.43.1740666152566; 
 Thu, 27 Feb 2025 06:22:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvCk74a5ejhjBllkAOfm++110zW0HlAe/VNXfUAjWC6HXkOqOgZGXaU+RkRq9U/kJeZk+vSA==
X-Received: by 2002:a17:907:9686:b0:ab7:d7fd:6250 with SMTP id
 a640c23a62f3a-abed1015488mr1399568666b.43.1740666152200; 
 Thu, 27 Feb 2025 06:22:32 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0dbc43sm131935466b.51.2025.02.27.06.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 05/12] rust: irq: wrap IRQState with Opaque<>
Date: Thu, 27 Feb 2025 15:22:12 +0100
Message-ID: <20250227142219.812270-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wLRFkBApl5qSqmfiPadFueEBsNQ07t8MC7Xlg2FbsGc_1740666153
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:46 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/irq.rs    | 15 ++++++++++-----
 rust/qemu-api/src/sysbus.rs |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/qemu-api/src/irq.rs b/rust/qemu-api/src/irq.rs
index 34c19263c23..1222d4fde30 100644
--- a/rust/qemu-api/src/irq.rs
+++ b/rust/qemu-api/src/irq.rs
@@ -8,10 +8,16 @@
 
 use crate::{
     bindings::{self, qemu_set_irq},
+    cell::Opaque,
     prelude::*,
     qom::ObjectClass,
 };
 
+/// An opaque wrapper around [`bindings::IRQState`].
+#[repr(transparent)]
+#[derive(Debug, qemu_api_macros::Wrapper)]
+pub struct IRQState(Opaque<bindings::IRQState>);
+
 /// Interrupt sources are used by devices to pass changes to a value (typically
 /// a boolean).  The interrupt sink is usually an interrupt controller or
 /// GPIO controller.
@@ -21,8 +27,7 @@
 /// method sends a `true` value to the sink.  If the guest has to see a
 /// different polarity, that change is performed by the board between the
 /// device and the interrupt controller.
-pub type IRQState = bindings::IRQState;
-
+///
 /// Interrupts are implemented as a pointer to the interrupt "sink", which has
 /// type [`IRQState`].  A device exposes its source as a QOM link property using
 /// a function such as [`SysBusDeviceMethods::init_irq`], and
@@ -40,7 +45,7 @@ pub struct InterruptSource<T = bool>
 where
     c_int: From<T>,
 {
-    cell: BqlCell<*mut IRQState>,
+    cell: BqlCell<*mut bindings::IRQState>,
     _marker: PhantomData<T>,
 }
 
@@ -79,11 +84,11 @@ pub fn set(&self, level: T) {
         }
     }
 
-    pub(crate) const fn as_ptr(&self) -> *mut *mut IRQState {
+    pub(crate) const fn as_ptr(&self) -> *mut *mut bindings::IRQState {
         self.cell.as_ptr()
     }
 
-    pub(crate) const fn slice_as_ptr(slice: &[Self]) -> *mut *mut IRQState {
+    pub(crate) const fn slice_as_ptr(slice: &[Self]) -> *mut *mut bindings::IRQState {
         assert!(!slice.is_empty());
         slice[0].as_ptr()
     }
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
index 04821a2b9b3..48803a655f9 100644
--- a/rust/qemu-api/src/sysbus.rs
+++ b/rust/qemu-api/src/sysbus.rs
@@ -79,6 +79,7 @@ fn mmio_map(&self, id: u32, addr: u64) {
     fn connect_irq(&self, id: u32, irq: &Owned<IRQState>) {
         assert!(bql_locked());
         let id: i32 = id.try_into().unwrap();
+        let irq: &IRQState = irq;
         unsafe {
             bindings::sysbus_connect_irq(self.as_mut_ptr(), id, irq.as_mut_ptr());
         }
-- 
2.48.1


