Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiDy-0001qv-HY
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDv-0001pv-Lj
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDu-00083B-0d
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akeAMDk9FwMfEl5tkTkqUI3vd74PME5w9KJGiAUAlW4=;
 b=cL571ztiq51zBri/dQmFEnHBu77egTvZ2travVDdZKRysY0Bzstdj1/XXCAg443xzuTE7S
 RT0tIkLYFwQV5c8f4UqhsuVRwJPSYYcS/Q66OMWkoqdcHxFG/lvlr9l8IXPtDYVskaxUH8
 YppYxITBjZpiwrbEGFm3bREzQdvC1E0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-EfXOdjYNMk-MpjQvrVAM2Q-1; Fri, 17 Jan 2025 04:01:00 -0500
X-MC-Unique: EfXOdjYNMk-MpjQvrVAM2Q-1
X-Mimecast-MFC-AGG-ID: EfXOdjYNMk-MpjQvrVAM2Q
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa6b904a886so155783666b.0
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104458; x=1737709258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=akeAMDk9FwMfEl5tkTkqUI3vd74PME5w9KJGiAUAlW4=;
 b=u2zCsXHKxiexU6lsNdFU/Ox/+oja3CmfGfU57KgAVXy6SgkmvuIR6/x5QfavIa1MaY
 lVOEorS4wkOvQo7DV4ELs6MjeoYzWK1DqqyGnFsxqwb2C1VB/nhPg4BZAkjibtSjUxmN
 lXNt4CjTk/UL7FWx6Qtcu8zXspUobh0WLqbvy5aueyBtwA5XEl2nZ5xUPrlPrdfF8gG3
 KV5Xvpqk9JZbpzx7Zso/5QoHlacXYODu6DT9Kb7+oMi3JLjj4OojzHZR561ueufEfAEC
 v+YaTMQleTACsb8+aKv9/Ue7xN2Bs+ufRTKx74iyjcVKZMTV6RGuf1SjuDaZVRf6mmJi
 /rlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3J2k4nMDWCjYylXNz7kLyEeYgKyt5c7KE4M5uw1+nJSxNYjrYZH2W9chAG7q02FWhTHUxJJgln4Q=@nongnu.org
X-Gm-Message-State: AOJu0Yy8GfPGONUuG57mK0tFaHRwVbaJicYSzcI7p6SgX7K5daSfo8TH
 pJpMXcCDtuB65GU1G5Nc06U/fEDFXa0x4I00RE8E0t0v3Hf/Lp7hbGCM7RgXhc7O+nsXnVOd1Qj
 +jEl4Mw8MISlubXIXaTsvsBlM08+9d8VgQCvpC1X6IhUI4MyGOf/SJ4XStWHOqA==
X-Gm-Gg: ASbGnctXuD19RoUv0dp9bHE4pQZDOJ3+t7UgNCRjrtOpKg/6ZKIoFIH8HgwdKP9LXHW
 mOlAGv4VSqFGIQa6nYZ0BWmtGaip0jy46C58fARKAGTWgqP4jnstpLiZLL0PzrrhVRVVAgQoaIG
 aOcA8CORpYVEwy43TPHmALc/6TsZPdRtvyCZidh+X3ya5zxgOu0+2tAhOHTh6dI4uW4bOeWV4IY
 5cASQX6qtNzMzPgbxjLWLsUqrHSS89tfStBfCrsBtewnmVyLmjIMnMK9F7o
X-Received: by 2002:a17:907:96a9:b0:ab2:f8e9:5f57 with SMTP id
 a640c23a62f3a-ab38b10f619mr195299066b.21.1737104458339; 
 Fri, 17 Jan 2025 01:00:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxHOU9OwRqV68XgP0xQ6V7I/WKMru/CxBrLxzuAJA1jP+I0o91Um4xqk7vMiXXcJ8BtwNJ5A==
X-Received: by 2002:a17:907:96a9:b0:ab2:f8e9:5f57 with SMTP id
 a640c23a62f3a-ab38b10f619mr195295466b.21.1737104457898; 
 Fri, 17 Jan 2025 01:00:57 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73edce5csm1179535a12.75.2025.01.17.01.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:00:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 03/10] rust: vmstate: add varray support to vmstate_of!
Date: Fri, 17 Jan 2025 10:00:39 +0100
Message-ID: <20250117090046.1045010-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117090046.1045010-1-pbonzini@redhat.com>
References: <20250117090046.1045010-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hkx_8dKBONfO3UZkvIw7eRJFUsrxxCszNaBESNOa5yE_1737104459
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
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
X-List-Received-Date: Fri, 17 Jan 2025 09:01:04 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 42 ++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index abe15c96011..3c3ed8510ab 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -72,6 +72,15 @@ pub unsafe trait VMState {
     /// The base contents of a `VMStateField` (minus the name and offset) for
     /// the type that is implementing the trait.
     const BASE: VMStateField;
+
+    /// A flag that is added to another field's `VMStateField` to specify the
+    /// length's type in a variable-sized array.  If this is not a supported
+    /// type for the length (i.e. if it is not `u8`, `u16`, `u32`), using it
+    /// in a call to [`vmstate_of!`](crate::vmstate_of) will cause a
+    /// compile-time error.
+    const VARRAY_FLAG: VMStateFlags = {
+        panic!("invalid type for variable-sized array");
+    };
 }
 
 /// Internal utility function to retrieve a type's `VMStateField`;
@@ -80,6 +89,13 @@ pub const fn vmstate_base<T: VMState>(_: PhantomData<T>) -> VMStateField {
     T::BASE
 }
 
+/// Internal utility function to retrieve a type's `VMStateFlags` when it
+/// is used as the element count of a `VMSTATE_VARRAY`; used by
+/// [`vmstate_of!`](crate::vmstate_of).
+pub const fn vmstate_varray_flag<T: VMState>(_: PhantomData<T>) -> VMStateField {
+    T::VARRAY_FLAG
+}
+
 /// Return the `VMStateField` for a field of a struct.  The field must be
 /// visible in the current scope.
 ///
@@ -87,18 +103,23 @@ pub const fn vmstate_base<T: VMState>(_: PhantomData<T>) -> VMStateField {
 /// for them.
 #[macro_export]
 macro_rules! vmstate_of {
-    ($struct_name:ty, $field_name:ident $(,)?) => {
+    ($struct_name:ty, $field_name:ident $([0 .. $num:ident $(* $factor:expr)?])? $(,)?) => {
         $crate::bindings::VMStateField {
             name: ::core::concat!(::core::stringify!($field_name), "\0")
                 .as_bytes()
                 .as_ptr() as *const ::std::os::raw::c_char,
             offset: $crate::offset_of!($struct_name, $field_name),
             // Compute most of the VMStateField from the type of the field.
+            $(.num_offset: $crate::offset_of!($struct_name, $num),)?
             ..$crate::call_func_with_field!(
                 $crate::vmstate::vmstate_base,
                 $struct_name,
                 $field_name
-            )
+            )$(.with_varray_flag($crate::call_func_with_field!(
+                    $crate::vmstate::vmstate_varray_flag,
+                    $struct_name,
+                    $num))
+               $(.with_varray_multiply($factor))?)?
         }
     };
 }
@@ -143,6 +164,22 @@ pub const fn with_pointer_flag(mut self) -> Self {
         self.flags = VMStateFlags(self.flags.0 | VMStateFlags::VMS_POINTER.0);
         self
     }
+
+    #[must_use]
+    pub const fn with_varray_flag<T: VMState>(mut self, flag: VMStateFlags) -> VMStateField {
+        assert!((self.flags.0 & VMStateFlags::VMS_ARRAY.0) != 0);
+        self.flags = VMStateFlags(self.flags.0 & !VMStateFlags::VMS_ARRAY.0);
+        self.flags = VMStateFlags(self.flags.0 | flag.0);
+        self
+    }
+
+    #[must_use]
+    pub const fn with_varray_multiply(mut self, num: u32) -> VMStateField {
+        assert!(num <= 0x7FFF_FFFFu32);
+        self.flags = VMStateFlags(self.flags.0 | VMStateFlags::VMS_MULTIPLY_ELEMENTS.0);
+        self.num = num as i32;
+        self
+    }
 }
 
 // Transparent wrappers: just use the internal type
@@ -154,6 +191,7 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
                 size: mem::size_of::<$type>(),
                 ..<$base as VMState>::BASE
             };
+            const VARRAY_FLAG: VMStateFlags = <$base as VMState>::VARRAY_FLAG;
         }
     };
 }
-- 
2.47.1


