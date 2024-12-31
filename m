Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3H-0003Ry-T1
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3G-0003Re-Mn
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ34-0001xq-Bs
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8eqX+r29sPapJhn/vLbtpBrgqJq/aUh19hK4P3NE2Y=;
 b=f7UiW4AESLVmA8IZ1rXYAHVm3AibAiYtXZIMa5uYJ2FAwJD7cyA2rgcIvOJwO7SM1lLHMm
 lADtu9SML+7a28w1xEIQGctXvy0kLdBaIxQZOaPJAZ5K7PfYhoB/qj/LlS0KZ9dJyOmuAT
 DkZqJQceHySyFDr+UMu3XZyCOG8nJks=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-ZgkJQTIWPHCq3evcfEeZZw-1; Mon, 30 Dec 2024 19:23:47 -0500
X-MC-Unique: ZgkJQTIWPHCq3evcfEeZZw-1
X-Mimecast-MFC-AGG-ID: ZgkJQTIWPHCq3evcfEeZZw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3860bc1d4f1so5317834f8f.2
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604626; x=1736209426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8eqX+r29sPapJhn/vLbtpBrgqJq/aUh19hK4P3NE2Y=;
 b=iGHhKmWNJxvTE4b1wrfoNoNltb3B3m6F4n83//6ZortzPy7RPFAr0NfDLeQzEuC5pD
 1gFm2Jnom3zdmHqDo+17FWOT5NOLlmEUSP7WltI93/Yh56hCnB/rH7fnn+bbqb99ll5D
 1DODN5p1Mdir50F27mgA0xrnbsMk6Pxmz/DyqHBTXhCJWO6oqkFBhs2LKYLwfWHRnB+q
 r9MfTOZZdDH1mhFREBsTAESnd2YdoMzrYptD/KXvv7XvjPdBiwnObSs35AgAc120nVjn
 +eiU0SNeOiuYobJ6oj+ug3izbiTLXddqetSP2buOzBfUxBoK/zqLqXRHjvPzUkFRYmKR
 6U8g==
X-Gm-Message-State: AOJu0YzJSPoEwdV3rlWcuxner5jP5zpJ4BILwcPzjPNmt0VWZWQ2w/xJ
 4XFYPaFaUzV2e2coM8Ty4ukYq7Vs4bU1wMsY3JD6mEvh3hyIBUwhdr/N0cDRo/JIMC8hbFODfpv
 pEiJQ9YRdCEkYad4hyTR3lGtJa/yODDZv6Wb9acIoAllz6lLW3q0=
X-Gm-Gg: ASbGncu+DIMfPesNmwvtDQ3Bd9v4zjLtNM/J/A/M82PQ3JOJcuNa6uoYnalURHiOX10
 ZRwGJEVmLIqI9UnkNL8UMsK4rBA2ssxKeT503AC+xA7dUmo+ZnZb+u5fcBoR3kbXmo5tbTN1iEp
 aS1xM4E7e74Og/eiy+ocA93jeXt0Ooosk1Jtt0xuYQiinGq7CH1kbYlhC3vSjsVykoEbYA9NaNJ
 H9UfZmZRu+npEV/vj50O8dE2LSVv8CK4/dtfFi71yt03fZXlx2QmryAQkE=
X-Received: by 2002:a5d:59ad:0:b0:386:32ca:aa12 with SMTP id
 ffacd0b85a97d-38a223feed2mr24894070f8f.49.1735604626388; 
 Mon, 30 Dec 2024 16:23:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZv9t08NRGO27ZZdgCK2GIiscRqxj0W9Mj/2mSZkxJaFIPLTAS5vXRDNETy4qIatVFZKL1uQ==
X-Received: by 2002:a5d:59ad:0:b0:386:32ca:aa12 with SMTP id
 ffacd0b85a97d-38a223feed2mr24894063f8f.49.1735604626072; 
 Mon, 30 Dec 2024 16:23:46 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832e8asm30944218f8f.37.2024.12.30.16.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 3/9] rust: vmstate: add varray support to vmstate_of!
Date: Tue, 31 Dec 2024 01:23:30 +0100
Message-ID: <20241231002336.25931-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 24EoKPW1i1Qtgtqge8MDgIuwAPv8QT8y1496zctj988_1735604626
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.187,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Dec 2024 00:24:02 -0000

Untested...

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 45 +++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index e20f27b172b..079c19c687b 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -69,6 +69,15 @@ pub unsafe trait VMState {
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
@@ -77,6 +86,13 @@ pub const fn vmstate_base<T: VMState>(_: PhantomData<T>) -> VMStateField {
     T::BASE
 }
 
+/// Internal utility function to retrieve a type's `VMStateFlags` when it
+/// is used as the element count of a `VMSTATE_VARRAY`; used by
+/// [`vmstate_of!`](crate::vmstate_of).
+pub const fn vmstate_varray_flag<T: VMState>(_: PhantomData<T>) -> VMStateField {
+    T::BASE
+}
+
 /// Return the `VMStateField` for a field of a struct.  The field must be
 /// visible in the current scope.
 ///
@@ -84,18 +100,24 @@ pub const fn vmstate_base<T: VMState>(_: PhantomData<T>) -> VMStateField {
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
-            // Compute most of the VMStateField from the type of the field.
+            $(.num_offset: $crate::offset_of!($struct_name, $num),)?
+            // The calls to `call_func_with_field!` are the magic that
+            // computes most of the VMStateField from the type of the field.
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
@@ -130,6 +152,22 @@ pub const fn with_pointer_flag(mut self) -> Self {
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
@@ -141,6 +179,7 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
                 size: mem::size_of::<$type>(),
                 ..<$base as VMState>::BASE
             };
+            const VARRAY_FLAG: VMStateFlags = <$base as VMState>::VARRAY_FLAG;
         }
     };
 }
-- 
2.47.1


