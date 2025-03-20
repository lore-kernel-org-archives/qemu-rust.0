Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvEUl-0002MH-Io
	for mharc-qemu-rust@gnu.org; Thu, 20 Mar 2025 07:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tvEUj-0002M0-Pj
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 07:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tvEUh-0008TP-OJ
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 07:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742471726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QzVg6/xCh+WV9e1uzDmGPvWkxytjcf5d1/QumLRzrjI=;
 b=jDc5DCNwDYh1pcspbT5x/4B1bHJ6VpKVqtEe1njxLwfwf0hwoEEhkm6IQeT7rYr3fEyeTp
 Nlu4bTwzST/nUug4PZNnJ2j9VB/hMS5eAWytWvmiqXpMOCNBPyABF39azX3RJ23CaqyFx1
 1HfGGHee75Frdxrr8Ac9utTYHTUHe6U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-cVm2s3ksMeqXoIkuef7_zw-1; Thu, 20 Mar 2025 07:55:25 -0400
X-MC-Unique: cVm2s3ksMeqXoIkuef7_zw-1
X-Mimecast-MFC-AGG-ID: cVm2s3ksMeqXoIkuef7_zw_1742471724
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf327e9a2so6051325e9.3
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 04:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742471723; x=1743076523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QzVg6/xCh+WV9e1uzDmGPvWkxytjcf5d1/QumLRzrjI=;
 b=p3Dv46Y8sGEK8ZaVnbjtYbFitMos0bAsuAcoYwJh8ZFLan/0Vg24FBFZybVGmLtl79
 qSc3RxaDcGiJ+Qz/W7T1Sa8da6qHweCl+VPtmi1sw2CLxUPGnvCIDOZGMd3hIWzX5Y2Y
 sg9vK8ow16V3G/HMhwHqEXxWYB4ahdLwqWYNzY2X0ykWVZn6mgcXtJ7U6KuV7ygy1Lwy
 WOLq0wDS5VTztRkgEdllmL8hLft3HPRtYli+ErveOEsBxiKtkz3n7UEmPaTXAREXlepN
 WV+JOaGOq2J73csgkaqJ+5XaWiMR6aeuk3ZuzlqfjT5Mx93Hq81oGMio+27Re1UXP/rE
 /4OA==
X-Gm-Message-State: AOJu0YxnUR0fCEKfgoUEp1gsA4vKPQBlvX1wxYgFFSeuyYcB2t07PsLQ
 ASS9rgINZyoe5eiuqGnrCk93XJH+q8KbI2uZ1vOocTK00AIwJRKhaj5ImGsiQA8TDY9qE7AQYln
 /HGBiyYfHlosU8poXr6VtOyzVqpuOIL1HKxe+0taw5KcAnKjrHynprs//Mug=
X-Gm-Gg: ASbGncsngwUL78JH+oqpaNVwr0vM8erYiiUSM0WP/HkTjLNygOsBSB24heeNvPVl+1J
 ZLVqVXfSzgfDSyD8FhB9NSuRHX62carAJtxtOlJVcX3TX5/xGZOHYevn8EWOpRxeP9OZx9/aSs/
 WgnewbMZL52L79EotG13nV4gGBhoa2W94/ps0Tt/z+USFt0+97BY4XWK8GSfbBnCXX2aessvNpT
 i71+xjxe4KgwAnXOswH+2ykfd0+SMqvnaNSGjtui3tWS49Yh7byripVkW5yTzwyUGUXbG3AMnLw
 hvF4XPSQxGQ99YB/lfO2
X-Received: by 2002:a5d:47c8:0:b0:38a:88ac:f115 with SMTP id
 ffacd0b85a97d-39973af8e00mr4691858f8f.34.1742471723376; 
 Thu, 20 Mar 2025 04:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw8ZCql9k9ALY9AvtPhmO+o36CMjDlXCXMtZ2CTWJ4tggQ9XKLV1Yptwys7OE58NfPl1Y0lg==
X-Received: by 2002:a5d:47c8:0:b0:38a:88ac:f115 with SMTP id
 ffacd0b85a97d-39973af8e00mr4691843f8f.34.1742471722979; 
 Thu, 20 Mar 2025 04:55:22 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.194.153])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b2bsm23121239f8f.26.2025.03.20.04.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 04:55:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] rust: assertions: add static_assert
Date: Thu, 20 Mar 2025 12:55:21 +0100
Message-ID: <20250320115521.808019-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5TjNS-mwVowmZpbLGmBEqInc-FL6wPoL60LuAcDAVhU_1742471724
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
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
X-List-Received-Date: Thu, 20 Mar 2025 11:55:30 -0000

Add a new assertion that is similar to "const { assert!(...) }" but can be used
outside functions and with older versions of Rust.  A similar macro is found in
Linux, whereas the "static_assertions" crate has a const_assert macro that
produces worse error messages.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Supersedes: <20250320113356.799412-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
index 104dec39774..bba38cfda11 100644
--- a/rust/qemu-api/src/assertions.rs
+++ b/rust/qemu-api/src/assertions.rs
@@ -120,3 +120,25 @@ macro_rules! assert_match {
         );
     };
 }
+
+/// Assert at compile time that an expression is true.  This is similar
+/// to `const { assert!(...); }` but it works outside functions, as well as
+/// on versions of Rust before 1.79.
+///
+/// # Examples
+///
+/// ```
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 3);
+/// ```
+///
+/// ```compile_fail
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 2); // does not compile
+/// ```
+#[macro_export]
+macro_rules! static_assert {
+    ($x:expr) => {
+        const _: () = assert!($x);
+    };
+}
-- 
2.48.1


