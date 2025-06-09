Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uOefv-0000S1-6r
	for mharc-qemu-rust@gnu.org; Mon, 09 Jun 2025 11:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOeft-0000P2-Do
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefr-0007hM-NR
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749483875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XtFw1Gm8P8SykWkqXaUzKJqdfFMOaemdUuq3TQP0wE=;
 b=NuHY9Ju37xFfDwZ4O6qPlNG7YoNlvqqsgrw9huNry5nxpWbqtVlcFFCp/IxcXQQGu+0Tnt
 sbQcap+FOlOVr50eYWPaDFc3ZnilkaM/rd7q3HxppG7jdCzvt6ljdzQNnGvYUwQKbl8zoS
 HFh3jM1DNJqE10Hb7sJdpVh45sJ3Sj8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-5cyvKCl7MPmtxBNPSKFjEw-1; Mon, 09 Jun 2025 11:44:33 -0400
X-MC-Unique: 5cyvKCl7MPmtxBNPSKFjEw-1
X-Mimecast-MFC-AGG-ID: 5cyvKCl7MPmtxBNPSKFjEw_1749483873
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39ee4b91d1cso2618643f8f.0
 for <qemu-rust@nongnu.org>; Mon, 09 Jun 2025 08:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749483872; x=1750088672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XtFw1Gm8P8SykWkqXaUzKJqdfFMOaemdUuq3TQP0wE=;
 b=HktlEuA9MRJ5octx1QkMPcY302tTiALDkWFwsPvcQ3v4dh9kvijv31CsXd09hAhDVG
 CkurSSTRWSmEhmApQ7qsx0MBbsRtYAgj9m+3FbtqjEFfZYkYoMvmmL8/8NTqWXvPkqyW
 V6qfb2DUGb3sDUkCTuBU55xUTF2ctmtIgGkCFvGZS0/oociweQVoczFifSRJ1c5L7ZvP
 gGYYDsodnQtPScrFTSUUQUX+P2kAXE3SlXRrJKfFE1YwXhByZat2789lQfyCUviJeCOQ
 oKQRbbo9oqOy2hNm3eZkxNraGXoiVtKyUNl4UFBpL4+MML2HAMPCKDyoVmjLhGWBvH0D
 q3xg==
X-Gm-Message-State: AOJu0YxIelLnSL3I/ybItJn0mTqgdluiIJSiwhBa3a0nTCBypkH48d2x
 WFAiQI7CM3vhdycZtqI9itC+cblzQCc0kNntb1Ut+wM2zbwmJNpBd6io1eRyGCwvXCV2FQA7iut
 Ig5dFRCQGymGk+9h8jGF7RlQnEqKz9zWxUxcdtMvdM8mlkoTtcrMQ6hjbmuvWFKE=
X-Gm-Gg: ASbGncv3vapklwy9+lvQNu+GgrR4UZ7Qj69oIim18DwMiuGasO06JPRzIPdRaQo9n8B
 dLzfwlp66rpKIxLwvviYkSNImC8ZSnmbldWN6v5cXu17A5fPnFe3EXmofKigBL+JK9kqmrCjE+z
 9kar2uqBh9pCSmili246VcaB9v5jO7wxUk1ilk0wbO/il3W69EUsaBaPsfFphdEyA21bKA8odU+
 RIG1UBD5MU+aPSySmac8PQ4ezCIa1ZxLp/zHMDLWwkg7Lgs6YNUM2hLxXd4Zv2WBnNQL1jJo4GY
 wsC5FF5Q1JvBX0uNz1rmOUDR
X-Received: by 2002:a05:6000:124c:b0:3a4:dfbe:2b14 with SMTP id
 ffacd0b85a97d-3a5513f6775mr11941f8f.16.1749483872165; 
 Mon, 09 Jun 2025 08:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA887dzRG+kwqNJMKkT2oJADBvSV+FfV5SewknSuJ4Z+XFGr12R8krTTB0SZuf5A77jgfh+Q==
X-Received: by 2002:a05:6000:124c:b0:3a4:dfbe:2b14 with SMTP id
 ffacd0b85a97d-3a5513f6775mr11932f8f.16.1749483871720; 
 Mon, 09 Jun 2025 08:44:31 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532464575sm9901756f8f.97.2025.06.09.08.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:44:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/5] rust: qom: introduce ParentInit
Date: Mon,  9 Jun 2025 17:44:21 +0200
Message-ID: <20250609154423.706056-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609154423.706056-1-pbonzini@redhat.com>
References: <20250609154423.706056-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uF7iajC5qYgZGPYaODjJCpy4JYXUC0YvsvSjK_6t6yI_1749483873
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 09 Jun 2025 15:44:37 -0000

This is a smart pointer for MaybeUninit; it can be upcasted to the
already-initialized parent classes, or dereferenced to a MaybeUninit
for the class that is being initialized.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qom.rs | 86 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 14f98fee60a..21c271cd2f9 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -95,7 +95,7 @@
 use std::{
     ffi::{c_void, CStr},
     fmt,
-    mem::ManuallyDrop,
+    mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},
     ptr::NonNull,
 };
@@ -206,6 +206,90 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> Result<(), fmt::Error> {
     }
 }
 
+/// This struct knows that the superclasses of the object have already been
+/// initialized.
+pub struct ParentInit<'a, T>(&'a mut MaybeUninit<T>);
+
+impl<'a, T> ParentInit<'a, T> {
+    #[inline]
+    pub fn with(obj: &'a mut MaybeUninit<T>, f: impl FnOnce(ParentInit<'a, T>)) {
+        let parent_init = ParentInit(obj);
+        f(parent_init)
+    }
+}
+
+impl<T: ObjectType> ParentInit<'_, T> {
+    /// Return the receiver as a mutable raw pointer to Object.
+    pub fn as_object_mut_ptr(&self) -> *mut bindings::Object {
+        self.as_object_ptr().cast_mut()
+    }
+
+    /// Return the receiver as a const raw pointer to Object.
+    /// This is preferrable to `as_object_mut_ptr()` if a C
+    /// function only needs a `const Object *`.
+    pub fn as_object_ptr(&self) -> *const bindings::Object {
+        self.0.as_ptr().cast()
+    }
+}
+
+impl<'a, T: ObjectImpl> ParentInit<'a, T> {
+    /// Convert from a derived type to one of its parent types, which
+    /// have already been initialized.
+    ///
+    /// # Safety
+    ///
+    /// Structurally this is always a safe operation; the [`IsA`] trait
+    /// provides static verification trait that `Self` dereferences to `U` or
+    /// a child of `U`, and only parent types of `T` are allowed.
+    ///
+    /// However, while the fields of the resulting reference are initialized,
+    /// calls might use uninitialized fields of the subclass.  It is your
+    /// responsibility to avoid this.
+    pub unsafe fn upcast<U: ObjectType>(&self) -> &'a U
+    where
+        T::ParentType: IsA<U>,
+    {
+        // SAFETY: soundness is declared via IsA<U>, which is an unsafe trait;
+        // the parent has been initialized before `instance_init `is called
+        unsafe { &*(self.0.as_ptr().cast::<U>()) }
+    }
+
+    /// Convert from a derived type to one of its parent types, which
+    /// have already been initialized.
+    ///
+    /// # Safety
+    ///
+    /// Structurally this is always a safe operation; the [`IsA`] trait
+    /// provides static verification trait that `Self` dereferences to `U` or
+    /// a child of `U`, and only parent types of `T` are allowed.
+    ///
+    /// However, while the fields of the resulting reference are initialized,
+    /// calls might use uninitialized fields of the subclass.  It is your
+    /// responsibility to avoid this.
+    pub unsafe fn upcast_mut<U: ObjectType>(&mut self) -> &'a mut U
+    where
+        T::ParentType: IsA<U>,
+    {
+        // SAFETY: soundness is declared via IsA<U>, which is an unsafe trait;
+        // the parent has been initialized before `instance_init `is called
+        unsafe { &mut *(self.0.as_mut_ptr().cast::<U>()) }
+    }
+}
+
+impl<T> Deref for ParentInit<'_, T> {
+    type Target = MaybeUninit<T>;
+
+    fn deref(&self) -> &Self::Target {
+        self.0
+    }
+}
+
+impl<T> DerefMut for ParentInit<'_, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        self.0
+    }
+}
+
 unsafe extern "C" fn rust_instance_init<T: ObjectImpl>(obj: *mut bindings::Object) {
     let mut state = NonNull::new(obj).unwrap().cast::<T>();
     // SAFETY: obj is an instance of T, since rust_instance_init<T>
-- 
2.49.0


