Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFU6L-0004sN-3C
	for mharc-qemu-rust@gnu.org; Mon, 25 Nov 2024 03:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU6F-0004qx-9J
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tFU69-0007Kd-2L
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 03:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732521931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgzaI2zMMeW5+NpW/m1snFUEJdiAuzPs3THN4ondNBU=;
 b=K9wcNi/u71DpArnGK8GEY34KT8d8gZBy2NIY7aLOxzKIVZ6joAmBrUts2UuE6BU30hojbF
 xjx5wdv9yFoVGKnH/dFXmsUu8ZG5blJfRM5lXJlxR6JNJuUZP+iGRNoHAIngSQ58qJiVl9
 mlLqXhmHN0ozu8WgbA+wOD3dtrLGSSw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-gbmK11fsMMq-_ndRr4X5Fg-1; Mon, 25 Nov 2024 03:05:30 -0500
X-MC-Unique: gbmK11fsMMq-_ndRr4X5Fg-1
X-Mimecast-MFC-AGG-ID: gbmK11fsMMq-_ndRr4X5Fg
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-431673032e6so29520545e9.0
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 00:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732521929; x=1733126729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CgzaI2zMMeW5+NpW/m1snFUEJdiAuzPs3THN4ondNBU=;
 b=QvNZLiS4PNm3zLxjb71nC30xML3u7TdAMQTUfiLneZwRTcdnpHipTpRyvMKUGLsF1t
 B/tDFdBiHlrLrvzKAue+4q0vamXjIOjCpR7BOsg4R8ZUjsc1a1hZeKfNfktMIl0iMEOj
 umGalLKjSqVMonbJtTvPE9eKkrNA83Dzs7HOXSphx9Jvhaw2qLGn5wksSLW2sE5oedJp
 8D+KRigeR45ooD2DkfPqjnvGuMiGbT5UX8o27TBzvflYnq93ryM7cHX7K+jUHXJ4Rgep
 ZlDiPpbmEbAhIbyaGViFaG1eE9ThoRUCxww+UualMkh6mJT3EM8JouuZbAxOURBow1Kz
 T28Q==
X-Gm-Message-State: AOJu0Yx8OK/8nR0FHJSSaG4dWZotsbvDSNT/abGjm97X7ZAD5njsY4hr
 FhX0xb2zl1/qaPpOJN0TPLEM+UzzkYhEKuyAK6LOLiU66DZBJb1h2ewcAMqjNyNut2oF6j0Ru/m
 8nGLlrT/s0KxnSIpvYObxCqD/C62U0htXl27fySmei4cMMslcoUI=
X-Gm-Gg: ASbGncuJXgORGyVke810Zn32sUZO7gQskw9E3uIQW4yfue7ZhdQyuwid2pzZD4nuXu5
 gMdsSTctiTjmznQb1aPWpN63la1onhq4hXd+9M3i7BB8rIESBavWKXac6x4xou4AzrtJVVHBE07
 jJabBFk7GoOV6exmBIsb4gtYh/Y8IQJbBW8nPVBuTL64pdfwjDtmowq0s2On4FInJdJACdW3WT1
 AD1waDbC5/XGeEzlWumMach1+/j9WhiRdhQ5Zv/4YNPi0URPeOra/g=
X-Received: by 2002:a7b:cb52:0:b0:431:6153:a258 with SMTP id
 5b1f17b1804b1-43487435826mr98689415e9.13.1732521929160; 
 Mon, 25 Nov 2024 00:05:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOhZoHrQ8RiZT4d903DCs85RPE9opYKq+CJaHW2LudvN8tkaa/a33obrwmh7uA+8yZ/GCxkQ==
X-Received: by 2002:a7b:cb52:0:b0:431:6153:a258 with SMTP id
 5b1f17b1804b1-43487435826mr98689185e9.13.1732521928794; 
 Mon, 25 Nov 2024 00:05:28 -0800 (PST)
Received: from [192.168.10.47] ([151.49.236.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43499da3eccsm45296925e9.1.2024.11.25.00.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 00:05:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 7/8] rust: qom: automatically use Drop trait to implement
 instance_finalize
Date: Mon, 25 Nov 2024 09:05:06 +0100
Message-ID: <20241125080507.115450-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125080507.115450-1-pbonzini@redhat.com>
References: <20241125080507.115450-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uTkUg70nEJDXaRE41KC8DePPV2MaziReXvR-_YBcaTc_1732521929
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.93,
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
X-List-Received-Date: Mon, 25 Nov 2024 08:05:41 -0000

Replace the customizable INSTANCE_FINALIZE with a generic function
that drops the Rust object.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/definitions.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
index 0467e6290e0..d64a581a5cc 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/definitions.rs
@@ -8,6 +8,13 @@
 
 use crate::bindings::{Object, ObjectClass, TypeInfo};
 
+unsafe extern "C" fn drop_object<T: ObjectImpl>(obj: *mut Object) {
+    // SAFETY: obj is an instance of T, since drop_object<T>
+    // is called from QOM core as the instance_finalize function
+    // for class T
+    unsafe { std::ptr::drop_in_place(obj.cast::<T>()) }
+}
+
 /// Trait a type must implement to be registered with QEMU.
 pub trait ObjectImpl: ClassInitImpl + Sized {
     type Class;
@@ -16,7 +23,6 @@ pub trait ObjectImpl: ClassInitImpl + Sized {
     const ABSTRACT: bool = false;
     const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
     const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
-    const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
 
     const TYPE_INFO: TypeInfo = TypeInfo {
         name: Self::TYPE_NAME.as_ptr(),
@@ -29,7 +35,7 @@ pub trait ObjectImpl: ClassInitImpl + Sized {
         instance_align: core::mem::align_of::<Self>(),
         instance_init: Self::INSTANCE_INIT,
         instance_post_init: Self::INSTANCE_POST_INIT,
-        instance_finalize: Self::INSTANCE_FINALIZE,
+        instance_finalize: Some(drop_object::<Self>),
         abstract_: Self::ABSTRACT,
         class_size: core::mem::size_of::<Self::Class>(),
         class_init: <Self as ClassInitImpl>::CLASS_INIT,
-- 
2.47.0


