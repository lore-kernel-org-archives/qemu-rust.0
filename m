Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tneo3-0006fP-6F
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tneml-0003yQ-VC
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemk-000495-0K
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8IXFl1tjzcTpL3RiOm0U3qS7SeRxt+gon+nIrKlE5k=;
 b=KWPqWCDkcq/z1mQFYeGV/bN6lf1vA+htWSbtGMeVtCFzK/tu72No/zRTJbS3BPKmC1Mxin
 U0nnEJHpXAJcEjbKnsDX6IAK4XIWdiigrpx1ncNEvW1XMm7DVS56dZSl/OLWhbUNSC3TN5
 QMkMumVCADRdmWGBfHeISjeYOl2FQFQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-L6rEqEjZPCKUWAc4Ecnarw-1; Thu, 27 Feb 2025 09:22:44 -0500
X-MC-Unique: L6rEqEjZPCKUWAc4Ecnarw-1
X-Mimecast-MFC-AGG-ID: L6rEqEjZPCKUWAc4Ecnarw_1740666163
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab39f65dc10so106411666b.1
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666162; x=1741270962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S8IXFl1tjzcTpL3RiOm0U3qS7SeRxt+gon+nIrKlE5k=;
 b=U7Ux2GiwuZUPgjg9EyGqHN1zihJkAj6Pn2mb2uoDwx65NtyLUWGpFUBUTJWabIVgzM
 BCQtQdvL8+aw0uM7Dlal/U6uVfFLWrgmG84QDGluk6yAUJS0XJr97FUfN7yGlZf/cUFQ
 FwiIjgnuYdirruuo/tYXIZPLB/0+PDxy9InZF15kqEzVLSjWb+9k5ZbnWn53uHQR1wTr
 y4MPq/X6pbKDTKmnAR9dwgkh5uBVIuJ2170AUgXAiDkzxhdYK9aY1ENYruMX3Ejkep+D
 6rw/KdajIw36xoEHScmKCSOmqyrNpibM/pMW3WdWWJvPd4jnrpczTxbML13AMq6dKKVX
 UPTA==
X-Gm-Message-State: AOJu0Yyil57Pj/iGh0G0cGQxDl9vNohHSyPQ4OEL1WI0HQTK4q4y3t01
 hMCYbfYHKRhJbpfUp127SdCO3ZmcVE6Ei8aezvRSlY27TZ+jloxfuuVnRT4Mh5z7IvKqmYAvT0G
 FKSXKWt6Y1hyHflwKGgzcnr+yNml0Q5+A7HUtquGilJClD4I/xLwGir0VcWyxrA==
X-Gm-Gg: ASbGncsV6p9fwmoIA0+QxvObKteQxBpX+JJifSGaCB9lNQVkKNTiGq4rMUTjkpjxIBI
 tcXVeMkdDSIMchdivSQ9Je+sGYrZchQyyeFrEysP7TfJoEaDh5Zf0NYeWs4VFhqVkv6v5DTp3LA
 /R6eo4Rrmys2l1zo0wZIgwjGObELStoQn/7CLE0PW+gIuzh5NepE90WCbbw45MemS5m3OZq9Gfx
 wLCQiXRKe7pbRvq9SdF/w1HZGBrvDdXbbiR3v9/Zy7BLPA4xjuBxJnL9RQ8kCFKcTE4DjJVpAVE
 F7qluESfpY8PyYkDFFQ2
X-Received: by 2002:a17:907:7710:b0:abb:6e07:3714 with SMTP id
 a640c23a62f3a-abed0c66ec7mr1325157066b.10.1740666161899; 
 Thu, 27 Feb 2025 06:22:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfH4DUS1aqoEPb8TbvHR8xTpCzsmC2z5Qrepw6+FBwsfJjKOd9cg0gRimz6jmdxtGHn68PWA==
X-Received: by 2002:a17:907:7710:b0:abb:6e07:3714 with SMTP id
 a640c23a62f3a-abed0c66ec7mr1325154266b.10.1740666161492; 
 Thu, 27 Feb 2025 06:22:41 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c75af58sm129868666b.147.2025.02.27.06.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 10/12] rust: memory: wrap MemoryRegion with Opaque<>
Date: Thu, 27 Feb 2025 15:22:17 +0100
Message-ID: <20250227142219.812270-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mUKYyHcMwUjgX_iSTtUhcwfxCvSqvSIlZPmSBFp5i9E_1740666163
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:49 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs |  3 ---
 rust/qemu-api/src/memory.rs   | 35 +++++++++++++++++++++--------------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index b791ca6d87f..26cc8de0cf2 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -34,9 +34,6 @@ unsafe impl Sync for CharBackend {}
 unsafe impl Send for Chardev {}
 unsafe impl Sync for Chardev {}
 
-unsafe impl Send for MemoryRegion {}
-unsafe impl Sync for MemoryRegion {}
-
 unsafe impl Send for ObjectClass {}
 unsafe impl Sync for ObjectClass {}
 
diff --git a/rust/qemu-api/src/memory.rs b/rust/qemu-api/src/memory.rs
index 713c494ca2e..eff9f09fd7f 100644
--- a/rust/qemu-api/src/memory.rs
+++ b/rust/qemu-api/src/memory.rs
@@ -6,9 +6,8 @@
 
 use std::{
     ffi::{CStr, CString},
-    marker::{PhantomData, PhantomPinned},
+    marker::PhantomData,
     os::raw::{c_uint, c_void},
-    ptr::addr_of,
 };
 
 pub use bindings::{hwaddr, MemTxAttrs};
@@ -16,6 +15,7 @@
 use crate::{
     bindings::{self, device_endian, memory_region_init_io},
     callbacks::FnCall,
+    cell::Opaque,
     prelude::*,
     zeroable::Zeroable,
 };
@@ -132,13 +132,13 @@ fn default() -> Self {
     }
 }
 
-/// A safe wrapper around [`bindings::MemoryRegion`].  Compared to the
-/// underlying C struct it is marked as pinned because the QOM tree
-/// contains a pointer to it.
-pub struct MemoryRegion {
-    inner: bindings::MemoryRegion,
-    _pin: PhantomPinned,
-}
+/// A safe wrapper around [`bindings::MemoryRegion`].
+#[repr(transparent)]
+#[derive(qemu_api_macros::Wrapper)]
+pub struct MemoryRegion(Opaque<bindings::MemoryRegion>);
+
+unsafe impl Send for MemoryRegion {}
+unsafe impl Sync for MemoryRegion {}
 
 impl MemoryRegion {
     // inline to ensure that it is not included in tests, which only
@@ -174,13 +174,20 @@ pub fn init_io<T: IsA<Object>>(
         size: u64,
     ) {
         unsafe {
-            Self::do_init_io(&mut self.inner, owner.cast::<Object>(), &ops.0, name, size);
+            Self::do_init_io(
+                // self.0.as_mut_ptr() needed because Rust tries to call
+                // ObjectDeref::as_mut_ptr() on "&mut Self", instead of coercing
+                // to "&Self" and then calling MemoryRegion::as_mut_ptr().
+                // Revisit if/when ObjectCastMut is not needed anymore; it is
+                // only used in a couple places for initialization.
+                self.0.as_mut_ptr(),
+                owner.cast::<Object>(),
+                &ops.0,
+                name,
+                size,
+            );
         }
     }
-
-    pub(crate) const fn as_mut_ptr(&self) -> *mut bindings::MemoryRegion {
-        addr_of!(self.inner) as *mut _
-    }
 }
 
 unsafe impl ObjectType for MemoryRegion {
-- 
2.48.1


