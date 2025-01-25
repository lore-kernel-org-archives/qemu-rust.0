Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tbjUy-0003xk-Io
	for mharc-qemu-rust@gnu.org; Sat, 25 Jan 2025 11:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbjUv-0003xF-QE
 for qemu-rust@nongnu.org; Sat, 25 Jan 2025 11:59:05 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbjUu-0008OY-6d
 for qemu-rust@nongnu.org; Sat, 25 Jan 2025 11:59:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38634c35129so2797656f8f.3
 for <qemu-rust@nongnu.org>; Sat, 25 Jan 2025 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737824343; x=1738429143; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7KSVe0Pu2BA5nyUjsZvrSv4yu0Zq1gmeaMsg5YcpCk=;
 b=MW1MlkQle2TEkxFbsOvyhv67COVhN7Z/fjKq7u2Y8uCKr3H/TN8tqrXjn/kngdiacf
 Csfjrk1OJOz7vXUxaRTXRwEzyRjVD5wgshKklx56YYiFqnk02SQkR9HGg2AtV5kFEUDk
 qYeWRvWubKMIgUB+vS1RBt4vyLofPSsebDw0CmzF4DNRw3AKZ6BU3nI4fJJSwZF9hEKW
 NMpA1k4XmlPa+8u1gxDD7jue929IkM46ddPETX+xmZde5DbNtJNVCfCCjApQXnk7vSju
 s7BhtykwWvjvNyy6N6BvBEasULXehN+Qr80+dItQFNwD7+2sV2Wlhbtx2BQnSmINwSQt
 N6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737824343; x=1738429143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7KSVe0Pu2BA5nyUjsZvrSv4yu0Zq1gmeaMsg5YcpCk=;
 b=EQ5WokQd6X4GnbH7R+JtGlBCNLwtAXPWsHKKMFNh/e99LWCSCCpGY915AenVvzMLDz
 Zgjm18MxztlJ0KenuOk6lYWZ6O/C7FCJrpeF6TLWu8xnAWjqqxz6ZYCnuJIvpH1dV0sB
 RGeaseLAyEvudGnFSXhrKqDFXiDY1r2MXRRSYZP3MgT0wrK55acJCOQTtVUJIb9GIyB4
 ZFDR8mkE6805tBItWZ/l+SWYEkt/zE/Zx9XeiKgm2ekDdVjj/jaxAjLrXp/3dVxAa0k4
 1O+kzumAB+Hs3uoyDrXgZekXXIDzq2zMlp/BmIGSik0HD5ywZGo+WwtRRG+GK5VLCr1O
 Yifw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY28LIrmwuGom+lN2XxYUnLsgdN15+iH/rF7qmn3mQ44l5MD0F4oHBOtk53QayvLf8rZBRV5aJNtI=@nongnu.org
X-Gm-Message-State: AOJu0YzNYnUuD8k/DDnUKmeruJM804eaWmGjh3aCB+lJYTt+xVNsNhiQ
 9AoVkFmEEd6ZI2HS4bkD2kW8848vU2Ko+tAc7o4pCnxBdzDHlObEmJqFXwjtTdw=
X-Gm-Gg: ASbGncsyPUOuK8IQlyCEKXXGsRaPdtxsT/IRcYZmujkkCQ5zAFSyCfWVOCUe8yqfiBt
 VQvpPP6mjw5tJpucL8Fewut0s3NuNvmYY4azZoYeekJVf6JCVQ64I9Up3er7Hab7nbdKtVCveSH
 ZASutPBzjKzHGMssizSxcEwqZYszTs2XG/wsOruIe9HYjWRj7gSluYyl52nCx2GC0y5LnVMus0e
 uAXU36KL0lMWsA/LyfoW0GjUUuEMnvWAlvc2yy18TT0wpNS4hal9l2pEpD6IvewmXIfjeMwdc5e
 NSrGJGe1JaxbhojLC2MRiKEZv9Qekb9RHdNsu3SEYPHQ7jHndJ5BZTU=
X-Google-Smtp-Source: AGHT+IEY/q6snjyQOBUoXWOdiFJPHuSkxSsUtir/U13sCGxAW4WnvHOwbzKXZWBGrF6VG97E7JoS1w==
X-Received: by 2002:a05:6000:1e48:b0:385:f00a:a45b with SMTP id
 ffacd0b85a97d-38bf5784bdamr26780412f8f.21.1737824342701; 
 Sat, 25 Jan 2025 08:59:02 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0easm5966939f8f.77.2025.01.25.08.59.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 08:59:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-rust@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] qom: Declare class_base_init() before class_init()
Date: Sat, 25 Jan 2025 17:58:54 +0100
Message-ID: <20250125165855.32168-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125165855.32168-1-philmd@linaro.org>
References: <20250125165855.32168-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Jan 2025 16:59:06 -0000

Since class_base_init() is called *before* class_init(),
move its declaration in TypeInfo before class_init() to
help a bit. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qom/object.h     | 10 +++++-----
 qom/object.c             |  4 ++--
 rust/qemu-api/src/qom.rs |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 9192265db76..3776267e903 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -457,14 +457,14 @@ struct Object
  *   assumed to be the size of the parent class.  This allows a type to avoid
  *   implementing an explicit class type if they are not adding additional
  *   virtual functions.
- * @class_init: This function is called after all parent class initialization
- *   has occurred to allow a class to set its default virtual method pointers.
- *   This is also the function to use to override virtual methods from a parent
- *   class.
  * @class_base_init: This function is called for all base classes after all
  *   parent class initialization has occurred, but before the class itself
  *   is initialized.  This is the function to use to undo the effects of
  *   memcpy from the parent class to the descendants.
+ * @class_init: This function is called after all parent class initialization
+ *   has occurred to allow a class to set its default virtual method pointers.
+ *   This is also the function to use to override virtual methods from a parent
+ *   class.
  * @class_data: Data to pass to the @class_init,
  *   @class_base_init. This can be useful when building dynamic
  *   classes.
@@ -486,8 +486,8 @@ struct TypeInfo
     bool abstract;
     size_t class_size;
 
-    void (*class_init)(ObjectClass *klass, void *data);
     void (*class_base_init)(ObjectClass *klass, void *data);
+    void (*class_init)(ObjectClass *klass, void *data);
     void *class_data;
 
     InterfaceInfo *interfaces;
diff --git a/qom/object.c b/qom/object.c
index ec447f14a78..1a686dff5a0 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -54,8 +54,8 @@ struct TypeImpl
     size_t instance_size;
     size_t instance_align;
 
-    void (*class_init)(ObjectClass *klass, void *data);
     void (*class_base_init)(ObjectClass *klass, void *data);
+    void (*class_init)(ObjectClass *klass, void *data);
 
     void *class_data;
 
@@ -119,8 +119,8 @@ static TypeImpl *type_new(const TypeInfo *info)
     ti->instance_size = info->instance_size;
     ti->instance_align = info->instance_align;
 
-    ti->class_init = info->class_init;
     ti->class_base_init = info->class_base_init;
+    ti->class_init = info->class_init;
     ti->class_data = info->class_data;
 
     ti->instance_init = info->instance_init;
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 97901fb9084..6033228e338 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -486,8 +486,8 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> {
         instance_finalize: Some(drop_object::<Self>),
         abstract_: Self::ABSTRACT,
         class_size: core::mem::size_of::<Self::Class>(),
-        class_init: Some(rust_class_init::<Self>),
         class_base_init: Self::CLASS_BASE_INIT,
+        class_init: Some(rust_class_init::<Self>),
         class_data: core::ptr::null_mut(),
         interfaces: core::ptr::null_mut(),
     };
-- 
2.47.1


