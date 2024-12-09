Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd2N-0004eU-Jd
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1T-0003z4-9H
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1P-0007T8-HO
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yc6FheuyZyH/oA7b36KKccLApc1+iqI4hAPCi9UKt0s=;
 b=Z0n3//cVs7fDgjQ8dBdYB69KDdTyzE2b1zWdeGo0ohwHOLnU3YRS2sG1TI/Z2U15Bg4+u8
 H3BqmNm//FYo47XDhQ0llQLQDaKhiBgJKqYHnvyolIqJumDsjduXAGtb4RjUC3D35b+iDK
 43k8FOAxKDgC9C6f3CPLA6p8oDTNMaA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-Wevz83j4OF22Ep3UG6SlDw-1; Mon, 09 Dec 2024 07:37:53 -0500
X-MC-Unique: Wevz83j4OF22Ep3UG6SlDw-1
X-Mimecast-MFC-AGG-ID: Wevz83j4OF22Ep3UG6SlDw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-434f3a758dbso9976745e9.0
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747871; x=1734352671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yc6FheuyZyH/oA7b36KKccLApc1+iqI4hAPCi9UKt0s=;
 b=qpZAKwFiQ61vbSwjuxjnFT6iR7n8IMEkgnu5XUvr2Mn0iKuetvVhSevtqwYrQNuFm4
 4OV6UzelwrnQ9lt3FtShtzO/G+QBZGPP6cpVj2YCeD/y4KxBVOgrKvhqfGOOtgk4+R/J
 HePmbQ1SYZh1sFZA6uMuaqThsiOkkcwJd85JuC4yIbROVtUHAxPbFuGuqbhhhBIcKSq5
 4AAE+baPNvXqhA8hHSHizKNDJOFQfH/Dh/U9ImqsPvGoODN7KCRj7ArtNX38frOVUJDX
 bv3zavBQpw6+apRqCNe9iSDUbr8qzGt37eZo5ZudRxaq9h3ToCa+koHRXgvdvSz6Ld9K
 hAKA==
X-Gm-Message-State: AOJu0YwR4RzvZaOEdNLPYn7gvfjLE+/VAvePd2H0YqTo1R4N2MtJKEGK
 sYRA6Oic5/ldLo0pyk3SAkqTEUCjShoxnCiPHkHPf9jUpmXRTdSlguXiR26MnD0XqmrEmmTqcr5
 YtBoxq+Zxa2I2QOFFieV3gdSTEqZvdcLlvZp3qFqz8kPTqj1+jEhcIZhHbuA=
X-Gm-Gg: ASbGncv/uFILjdeh+/HulFZZ0S2B9FC48W8YtfSZrOcWdmoBooS7vkWn/CfLSNxrbHk
 fAPgEID9FxC9EOvcRYNwqC/sSHSFJmaKl3m7Z+sAKQDF0UvROEjmt4sQdK+VksdP0a8ckttaNqP
 4gOo9b53MTVuJYEDFY1Kvt+21Kxo6SwEd7YuYvrfM2TBQv/aRBQif+VQDtz5R5by5y3Yd94Tl1X
 qt5nDyZbNh/syg3IDAsTdyvsGT0DNOx+S9LogRapHgiHSAmH0fmTQ==
X-Received: by 2002:a05:600c:458c:b0:434:9ec0:9e4e with SMTP id
 5b1f17b1804b1-434fffba059mr3550035e9.30.1733747871607; 
 Mon, 09 Dec 2024 04:37:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXo5oYAIaHVB3/q0A3uBCASjycc1vAb0yhaygilhId7tYKgqlabvux4EtEuo9ZUx2wrcbr3A==
X-Received: by 2002:a05:600c:458c:b0:434:9ec0:9e4e with SMTP id
 5b1f17b1804b1-434fffba059mr3549755e9.30.1733747871210; 
 Mon, 09 Dec 2024 04:37:51 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f43aedb2sm55069405e9.41.2024.12.09.04.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 13/26] rust: qom: automatically use Drop trait to implement
 instance_finalize
Date: Mon,  9 Dec 2024 13:37:04 +0100
Message-ID: <20241209123717.99077-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sC0RFNsHsBL-WRM1RTDLk2ZmN_XGWSN6Wvk7TouRLvY_1733747872
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:59 -0000

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
2.47.1


