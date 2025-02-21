Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRy-0008Kz-7C
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRt-0007x6-Cf
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRr-0001Wn-Rj
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tF++Gjxl8qlA5pYY+tAt3HrugPJ8B0H6ljBKbOe9dP8=;
 b=GPvlH+a3OqCb23FR8wsqxQ34cSUUlrOxjwvIOoNpWf3DKoYW+M/iVP2IMlpUUzN6I/05eT
 KOc1eKdeIKRQpb6b2v3vDBUkiJAhYg5TZg6kRcf2xxviEDzMoHsWlkCoVH/klBu5230Dde
 nk2LyLL07lNjFkMdyhirmAF08zs8lQM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-fzExeMjoPcmW0DxdgtBXOQ-1; Fri, 21 Feb 2025 12:04:21 -0500
X-MC-Unique: fzExeMjoPcmW0DxdgtBXOQ-1
X-Mimecast-MFC-AGG-ID: fzExeMjoPcmW0DxdgtBXOQ_1740157460
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-abbaac605c3so244878166b.0
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157457; x=1740762257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tF++Gjxl8qlA5pYY+tAt3HrugPJ8B0H6ljBKbOe9dP8=;
 b=RTL4CbW27WNLKpfpQnGfIQdyjk3HU41trEJFuw2Moib8pEahd3pi3j1M2aOc5i5Ydm
 iAIRDIPM3IPYXI6u+CMkbQcZgO3WgotqJIce3/gdVSOOLqdsUBZ6GqJfvKki1LwjDFF9
 ZbcyoC0/DmRBAA0n0keqfPn2chz+DZLBhtxQ2FLrC04Luzd9VgAsgTULQW5V6AmCjUtQ
 knc2arDqjBD5lJ2KwOI8TPEJJs60h32LMWNr6s/J8C4NAZLHqUXUV95NvMUX7f95feuw
 EzYIONeyF6pclMzg4HHdv9IiC5zALk63/ISQhwAgN3AzAAwtReRTiHteEB2+bT3TDIoe
 Hqvw==
X-Gm-Message-State: AOJu0YxM2k8p+3VPYH/MHAb62Tcu6rKYcq2ETL/zg95aNoOMnvpQiqVW
 1a1lgYLxF+ONCxH3+fyBfk3ZByh54HpKqr55zZCK6G3SInpqgojBJDnU8qfGdt5zVjgk55C2fUh
 Oe/aelOiufiT7XNyKVsfwNMIRJhEj/KQgy7vpacbUUgvRIp8ZMRXL/LqL+8QpRQ==
X-Gm-Gg: ASbGncuinyYZz1Tqjjt8K5iYij9RBksfLE1mfaxHgef2QfWtX+Qr1taYSb2nB2NX5K7
 4x/C/6AkKElrjZYRAlk3P7zSFlVUFpWf40rNzWtrYXZH8i4X5xI8WjcP49QvVcWBFo4woZAwM9S
 hbhVGKU/dPNzejy0EwmnBNMvibVwoVzSgq/yDLqzlJfRKds4VtJqPNQ6Lu4lBdxPFTRWVM7pFvo
 J/LIgiCmU9tbbGUe1SPGVXImy/VljRU5WQgw9EaPvepRMwJ4ljV727S5Ry+Y7WIjB6zRb5tD+b8
 lM13tXFDJTW7ghspujU=
X-Received: by 2002:a17:907:d16:b0:aa6:b63a:4521 with SMTP id
 a640c23a62f3a-abc0d9dd9ecmr343453966b.15.1740157457236; 
 Fri, 21 Feb 2025 09:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlGheNS8hhPmT17THOlcjVYtIbDYCcx1/8bOp+Nm/X18M30oIRTJKprBJsZsTUU4Ax0giO3Q==
X-Received: by 2002:a17:907:d16:b0:aa6:b63a:4521 with SMTP id
 a640c23a62f3a-abc0d9dd9ecmr343447666b.15.1740157456472; 
 Fri, 21 Feb 2025 09:04:16 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba9cf8a262sm1389156466b.22.2025.02.21.09.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:04:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 13/15] rust: memory: wrap MemoryRegion with Opaque<>
Date: Fri, 21 Feb 2025 18:03:40 +0100
Message-ID: <20250221170342.63591-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7W-rjPnhMKJnukuz0I7k2v-lJ6egxD46R3you5lvCoY_1740157460
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:25 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs |  3 ---
 rust/qemu-api/src/memory.rs   | 30 ++++++++++++++++--------------
 2 files changed, 16 insertions(+), 17 deletions(-)

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
index 713c494ca2e..fdb1ea11fcf 100644
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
@@ -174,13 +174,15 @@ pub fn init_io<T: IsA<Object>>(
         size: u64,
     ) {
         unsafe {
-            Self::do_init_io(&mut self.inner, owner.cast::<Object>(), &ops.0, name, size);
+            Self::do_init_io(
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


