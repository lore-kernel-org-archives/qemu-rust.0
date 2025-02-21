Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRn-0007em-Lh
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRk-0007W8-Fv
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRi-0001U3-Hh
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptln7kC4VQ55Kh7p6OYpuJx9dpz1kCK9KqyudGJngSI=;
 b=WFbVdHcu2RRlp7OO0jQDg6P/RTK7kTMNyk4C99xv9MKg4tpchcph8SLR/Yh1J21CcVo1Zo
 KX0+5U7Qy97GtZlBMdVQV4uAGmf+RXl+W/mxoWiRmlHdK9hUMyymKu1CTJwblAM22j+wyt
 ikrXNbZuRm6lqcdYVPH4aorhPMuSRyA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-HiIjQIGvMY6F0PRSr4i2MQ-1; Fri, 21 Feb 2025 12:04:08 -0500
X-MC-Unique: HiIjQIGvMY6F0PRSr4i2MQ-1
X-Mimecast-MFC-AGG-ID: HiIjQIGvMY6F0PRSr4i2MQ_1740157448
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-438da39bb69so16014975e9.0
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157447; x=1740762247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptln7kC4VQ55Kh7p6OYpuJx9dpz1kCK9KqyudGJngSI=;
 b=WojbSZqMv8qzhSrP+zzWknbVXW8w5ceeer6YTHDmvvo83FFPh+J3IrijBCwpaR2KvP
 hp/ZS26AoBww6brim9rtoBERrqLzWIA1AKHNfxVxSt1kAJQpbJqbQ/AVDYcqLCl//KvI
 EW8TNQMosGZAIXspYlJPQyPRAKw5vDEJknbsLXPtJwVhBujzwY7Ru5lkGvMCxgq+Z7+K
 hnTFZDhi+xrV8EFo2aj0XmkDR95t8E7iVUdMYa2apxcfDR0McRRajzbd+JLKeMfWHrg2
 wOM4X7QzYtyEJorwJmkzc2SWxfZCL3PXaYsPIFf2YmcxR4KYVCFKv/I1yI66wpFOvVhR
 HU7g==
X-Gm-Message-State: AOJu0YzqadRoM4+K3JNbfd/biZacczTrZeQB9YSndpDtwuJBrskqMRG9
 YU4eRAfZcSwGibm/w1LCCKOwHf641R7p1gdS21eoShx+/KcjpFytijm05GKyhUxHURWs0BRk3IZ
 UPhSjZwtQrGCQzLMxMpBhNporgc7Q61rc7lc//T8Ht6QUrsKtiDh7GBa9RZRg4g==
X-Gm-Gg: ASbGncs7XEN+574vnYwo4MdjKSUcprA1nqyEWc8O1370JT9PVzpGv5IhjwOubQENpzI
 eBW77deNTq+VIT5Xis5OW8D6il2TeQl8n73Ls6wyW/ccKiWYmFYhAAtBJJ41aIf94sNOYZ+r/LA
 TNvCEsoI0EunYZjot1pzzb61M/tbPCrHj6rrmxvCuSZAYwVeOE0g1HJIWnbqxAs2REnq9dCvMuU
 WvL7rqolfmNdw/UxG7SBeSonx5gV1DTRBim5rMEtZjfUDnnsgpw3xItUeaRz0Zl5+h517B4+qB4
 71X3PL815ol2CLtSFAg=
X-Received: by 2002:a05:600c:1c9d:b0:439:88bb:d02f with SMTP id
 5b1f17b1804b1-439b1b7fdfamr27090205e9.5.1740157446874; 
 Fri, 21 Feb 2025 09:04:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5lQklDkjGCKQ5dzNMU7dIqrOWUiGmo7zLHwx/J7q+hv1FUD3/VB0Q4LzK4MqDgH6vbWTClQ==
X-Received: by 2002:a05:600c:1c9d:b0:439:88bb:d02f with SMTP id
 5b1f17b1804b1-439b1b7fdfamr27089635e9.5.1740157446414; 
 Fri, 21 Feb 2025 09:04:06 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b44b2sm23583763f8f.20.2025.02.21.09.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:04:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 09/15] rust: irq: wrap IRQState with Opaque<>
Date: Fri, 21 Feb 2025 18:03:36 +0100
Message-ID: <20250221170342.63591-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kp_vOaNDunyU6WfPYar4OE2kXkqG40IU1LhJ0AUNQps_1740157448
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:17 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/irq.rs    | 15 ++++++++++-----
 rust/qemu-api/src/sysbus.rs |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/qemu-api/src/irq.rs b/rust/qemu-api/src/irq.rs
index d1c9dc96eff..aec2825b2f9 100644
--- a/rust/qemu-api/src/irq.rs
+++ b/rust/qemu-api/src/irq.rs
@@ -9,10 +9,16 @@
 
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
@@ -22,8 +28,7 @@
 /// method sends a `true` value to the sink.  If the guest has to see a
 /// different polarity, that change is performed by the board between the
 /// device and the interrupt controller.
-pub type IRQState = bindings::IRQState;
-
+///
 /// Interrupts are implemented as a pointer to the interrupt "sink", which has
 /// type [`IRQState`].  A device exposes its source as a QOM link property using
 /// a function such as [`SysBusDeviceMethods::init_irq`], and
@@ -41,7 +46,7 @@ pub struct InterruptSource<T = bool>
 where
     c_int: From<T>,
 {
-    cell: BqlCell<*mut IRQState>,
+    cell: BqlCell<*mut bindings::IRQState>,
     _marker: PhantomData<T>,
 }
 
@@ -80,11 +85,11 @@ pub fn set(&self, level: T) {
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


