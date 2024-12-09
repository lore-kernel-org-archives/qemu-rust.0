Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd6h-0008O5-5f
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1k-00046R-3T
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1i-0007Xw-2k
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmaMuh+/1R6nn1pVbFPg8WJblYj+VkUXSy659iDTG4g=;
 b=NbIcWB2baPRpiAzjJvHrg3xr5iNCXh0TE6yuTbI3AAljQLrxcTZ/FTj674K8Fx5B4y/1kB
 hVMPHJs9CLV1lRJ1o2QPUpSUjwRI434yFl1FPkiQ7knk15f+H9GK7Kt74fp/QgpB2+yLNX
 mOLmF/5/4x6aZZ78Oi9lCdlfdxOh79E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-Ae-ZLMeTOYuUzGZ7y3-60w-1; Mon, 09 Dec 2024 07:38:11 -0500
X-MC-Unique: Ae-ZLMeTOYuUzGZ7y3-60w-1
X-Mimecast-MFC-AGG-ID: Ae-ZLMeTOYuUzGZ7y3-60w
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-434f02ea82dso14300755e9.3
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747889; x=1734352689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmaMuh+/1R6nn1pVbFPg8WJblYj+VkUXSy659iDTG4g=;
 b=hKX+TXJP8Ro1ER7n6V5F64dhr21bG5Qz0YZwGH2Cbm1MhGB8j0XYjNOc4PpNHeEZPM
 TAUfhF0Kxk2j84gWVx5n3f6PQUNAsXsw0z0BQuJ3PkwuiqjDVRHQhuf0vOYqs+36yftt
 GoijY1DmzcQSh0OuOeR0EDBGQ4qm0ODhhJjdrBhQsF4GtGbjE08wS1Xq3UjJE63hOPjf
 yn3p5xgK+NbaNYO1GJTsp23DzUNOJzwqibisqhZBAagoXYqv3ywTK+DYPavtewCpI/o2
 3CdnfiZPPUeVLUuMtnHDBOiVvujltWrn3iFGifq1rqkhAGAUTVouV9Mu9uYT73K5HyTa
 1zxg==
X-Gm-Message-State: AOJu0YzjCFeep+Pgr9z+rOaJR83Oe7+/N2CKH/+2tYX2duaKlT3oCw7h
 BhAEtZuzHK/6VCiUIgVon6WoDay4qN3BgfMRDf70+3liSx6WelDUVd4sF/3+5P86k9KlvPIiOks
 9q8TIAJWHHnjRgIkYKvsShQuYrsrNNg1Qv52badlaC4rCcyzoZfx0UeTqEvY=
X-Gm-Gg: ASbGncv/3qnr9apk6fmp9656XVIl31c92JYH2UKkJic6i8FLTTLC27ApAv8Lxy3xAIe
 7guefPoGOUDdhZph3ljECv8UwtsCEih8Zvz6bPkhWFki/8/OY6JgVDyf4mwoHOFoHGyTpRW7sa7
 GB753qPmU9Cs/4CllcSErRpyzmXypocrjgKiO0v9p4dHMPXdS+kGz0uNwjtTvLx+j+5OSYzr8kZ
 QvdnaKH4SWdk0hKKUlNqV+nzEwJk/Wc0v+ImBx4fDT6egFlO5dLww==
X-Received: by 2002:a05:600c:1c96:b0:431:5632:448b with SMTP id
 5b1f17b1804b1-434fff9849dmr2482215e9.25.1733747888796; 
 Mon, 09 Dec 2024 04:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzxrIt2hL84FuIM5l+V57mX/GA9hUrrhEw+bUfQlZXN7YqyIgAcSrIvzXh5BA7Vs54nPmEKg==
X-Received: by 2002:a05:600c:1c96:b0:431:5632:448b with SMTP id
 5b1f17b1804b1-434fff9849dmr2482005e9.25.1733747888422; 
 Mon, 09 Dec 2024 04:38:08 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527395csm189736155e9.17.2024.12.09.04.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:38:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 20/26] rust: re-export C types from qemu-api submodules
Date: Mon,  9 Dec 2024 13:37:11 +0100
Message-ID: <20241209123717.99077-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XNmxMj7KtUrq-nlV-aPACgoVTFNQLgmBEJCKE-CeHuw_1733747890
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 12:38:30 -0000
X-List-Received-Date: Mon, 09 Dec 2024 12:38:30 -0000

Long term we do not want device code to use "bindings" at all, so make it
possible to get the relevant types from the other modules of qemu-api.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qdev.rs    |  7 +++++--
 rust/qemu-api/src/qom.rs     | 10 ++++++----
 rust/qemu-api/src/sysbus.rs  |  3 ++-
 rust/qemu-api/src/vmstate.rs |  9 +++++----
 rust/qemu-api/tests/tests.rs |  3 ++-
 5 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 1228dabaaaf..96a4b1515da 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -6,10 +6,13 @@
 
 use std::ffi::CStr;
 
+pub use bindings::{DeviceClass, DeviceState, Property};
+
 use crate::{
-    bindings::{self, DeviceClass, DeviceState, Error, ObjectClass, Property, VMStateDescription},
+    bindings::{self, Error},
     prelude::*,
-    qom::ClassInitImpl,
+    qom::{ClassInitImpl, ObjectClass},
+    vmstate::VMStateDescription,
     zeroable::Zeroable,
 };
 
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 9b316e07efa..6e3923d8ed0 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -36,7 +36,9 @@
 
 use std::{ffi::CStr, os::raw::c_void};
 
-use crate::bindings::{self, Object, ObjectClass, TypeInfo};
+pub use bindings::{Object, ObjectClass};
+
+use crate::bindings::{self, TypeInfo};
 
 unsafe extern "C" fn rust_instance_init<T: ObjectImpl>(obj: *mut Object) {
     // SAFETY: obj is an instance of T, since rust_instance_init<T>
@@ -161,8 +163,8 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> {
 ///
 /// Each struct will implement this trait with `T` equal to each
 /// superclass.  For example, a device should implement at least
-/// `ClassInitImpl<`[`DeviceClass`](crate::bindings::DeviceClass)`>` and
-/// `ClassInitImpl<`[`ObjectClass`](crate::bindings::ObjectClass)`>`.
+/// `ClassInitImpl<`[`DeviceClass`](crate::qdev::DeviceClass)`>` and
+/// `ClassInitImpl<`[`ObjectClass`]`>`.
 ///
 /// Fortunately, this is almost never necessary.  Instead, the Rust
 /// implementation of methods will usually come from a trait like
@@ -193,7 +195,7 @@ pub trait ClassInitImpl<T> {
     ///
     /// The virtual method implementations usually come from another
     /// trait, for example [`DeviceImpl`](crate::qdev::DeviceImpl)
-    /// when `T` is [`DeviceClass`](crate::bindings::DeviceClass).
+    /// when `T` is [`DeviceClass`](crate::qdev::DeviceClass).
     ///
     /// On entry, `klass`'s parent class is initialized, while the other fields
     /// are all zero; it is therefore assumed that all fields in `T` can be
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
index fa69cadd7c1..a23562d7273 100644
--- a/rust/qemu-api/src/sysbus.rs
+++ b/rust/qemu-api/src/sysbus.rs
@@ -7,10 +7,11 @@
 pub use bindings::{SysBusDevice, SysBusDeviceClass};
 
 use crate::{
-    bindings::{self, DeviceClass},
+    bindings,
     cell::bql_locked,
     irq::InterruptSource,
     prelude::*,
+    qdev::DeviceClass,
     qom::ClassInitImpl,
 };
 
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index bedcf1e8f39..25c68b703ea 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -10,6 +10,8 @@
 //! [`vmstate_fields`](crate::vmstate_fields) are meant to be used when
 //! declaring a device model state struct.
 
+pub use crate::bindings::VMStateDescription;
+
 #[doc(alias = "VMSTATE_UNUSED_BUFFER")]
 #[macro_export]
 macro_rules! vmstate_unused_buffer {
@@ -328,7 +330,7 @@ macro_rules! vmstate_fields {
 }
 
 /// A transparent wrapper type for the `subsections` field of
-/// [`VMStateDescription`](crate::bindings::VMStateDescription).
+/// [`VMStateDescription`].
 ///
 /// This is necessary to be able to declare subsection descriptions as statics,
 /// because the only way to implement `Sync` for a foreign type (and `*const`
@@ -342,9 +344,8 @@ macro_rules! vmstate_fields {
 
 unsafe impl Sync for VMStateSubsectionsWrapper {}
 
-/// Helper macro to declare a list of subsections
-/// ([`VMStateDescription`](`crate::bindings::VMStateDescription`)) into a
-/// static and return a pointer to the array of pointers it created.
+/// Helper macro to declare a list of subsections ([`VMStateDescription`])
+/// into a static and return a pointer to the array of pointers it created.
 #[macro_export]
 macro_rules! vmstate_subsections {
     ($($subsection:expr),*$(,)*) => {{
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index fc57eb81290..68557fb85c7 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -8,8 +8,9 @@
     bindings::*,
     c_str, declare_properties, define_property,
     prelude::*,
-    qdev::DeviceImpl,
+    qdev::{DeviceImpl, DeviceState, Property},
     qom::ObjectImpl,
+    vmstate::VMStateDescription,
     zeroable::Zeroable,
 };
 
-- 
2.47.1


