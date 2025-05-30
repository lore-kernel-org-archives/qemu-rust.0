Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKui6-0002Te-Lw
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKui4-0002PI-BE
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKui2-0004ZB-KA
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCq8tY2fAXF+N+KSLu0bH/nomQD4+3xw+ZZePK8BKis=;
 b=Ltvwj4jftDYdRF4iy+ZCbWEKgC4Y13muR++5xsvtBhmmziJO8DsSIeWwP2aItkxUZ9gLmg
 MpoEeuhP3giOBXOunlvLlUaSiQDh6DH72OH3tb//7NfMQIpd1iik6uqfp8P8f3XzgWn5Pa
 kBdbtdOLk4kvT5kQvZ+iODij7zUN/ks=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-ZBdpOyaKM8GCJqLhebXXVQ-1; Fri, 30 May 2025 04:03:20 -0400
X-MC-Unique: ZBdpOyaKM8GCJqLhebXXVQ-1
X-Mimecast-MFC-AGG-ID: ZBdpOyaKM8GCJqLhebXXVQ_1748592199
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-acbbb000796so134721466b.2
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592199; x=1749196999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCq8tY2fAXF+N+KSLu0bH/nomQD4+3xw+ZZePK8BKis=;
 b=nq/4E1kwL15uIH0+t5Vj+O4exZ5Wt406IYEXERWcSzAexBxtVWnPGLHHNtW+Yq+c54
 Gs2HmBUrsvJZS1qEJX9k5RmlJ3aWehuV135iayXBZF3jl4Ot5oIQ/dxPuQTOMjcMJTxE
 nUzGXfQnV3O+dRRyG1LCrARkH33hZe6iVNEwB/qWaGxoAwxXQnaGAsAZcXIN60L8aGny
 lecr2CKPchQDQ7/m7fYqPDxNygyXTwPAb+1F4hU8FU7DTeKEXFWbvn4UrWnDNou8oGIk
 TB3CjtcMgJ9qK6+ebTKJsspIcMILvZv1W6pE1EP3gHAPQejyJG+kiCBTRJnhd1sAXlh+
 xKRQ==
X-Gm-Message-State: AOJu0YzqU3/EGmpCViymKl11es5p8okLfp/KWwC+j5ODPXyZdkI4VEFl
 gQQe/4bORkWt1v1ok6+lKskQd2b0Bo5hP+9KbKfsasmwmHJb4qDBal7pV1QgjDD90dBx0yQaGsm
 VQJS3IlshVmMJHYeL6ocWbKMToR5Utj26rWSZF4aVt2iMHZwr1tBf2Fs=
X-Gm-Gg: ASbGncvtMhbQ4e4WjjZlXwf57GiM/3963i4jBdoQVqbSqC4wKA42YJHi3PiHBk0R6uo
 tQKzkDZT7TvmvJU5IkJjDBZNyZlo8epTHCroymDvGchUd8lWhQT5MO8SL/haS1AIpCawf3Qp1c+
 ZDxct/lXrZcmvX3qc6JKAEg9clj3vC/QuQh1vTrbwHY8mLjKz/nGBdvV/AImBfdbksQ97ne8MkA
 +jmt7G4kv/zX/8Y8kwrO3rlrxg4Gn7ESDmVYvQYAf67X8fN2E+Hg7dM2rmY4t6IEpjKO5KqcSJT
 A4pE+frvr7aRYA==
X-Received: by 2002:a17:907:3fa1:b0:ad8:8efe:3205 with SMTP id
 a640c23a62f3a-adb36c28fccmr117420266b.55.1748592199275; 
 Fri, 30 May 2025 01:03:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEQo5YG2tBnLVZRsKJ1asxjNl5WUXpmCn1//UgZx80NcLLRq98xU2Qn9nIuErLvCzhcSS9LA==
X-Received: by 2002:a17:907:3fa1:b0:ad8:8efe:3205 with SMTP id
 a640c23a62f3a-adb36c28fccmr117416966b.55.1748592198752; 
 Fri, 30 May 2025 01:03:18 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82d6fdsm282107766b.49.2025.05.30.01.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 04/14] util/error: allow non-NUL-terminated err->src
Date: Fri, 30 May 2025 10:02:56 +0200
Message-ID: <20250530080307.2055502-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tuk2XZYBNIQcZEmbNmvL5-3ZeGp9XNVeRJOKmX3Nhus_1748592199
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.902,
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
X-List-Received-Date: Fri, 30 May 2025 08:03:24 -0000

Rust makes the current file available as a statically-allocated string,
but without a NUL terminator.  Allow this by storing an optional maximum
length in the Error.

Note that for portability I am not relying on fprintf's precision
specifier not accessing memory beyond what will be printed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/error-internal.h | 1 +
 util/error.c                  | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/qapi/error-internal.h b/include/qapi/error-internal.h
index d5c3904adec..f5eb8ad2379 100644
--- a/include/qapi/error-internal.h
+++ b/include/qapi/error-internal.h
@@ -19,6 +19,7 @@ struct Error
     char *msg;
     ErrorClass err_class;
     const char *src, *func;
+    int src_len;
     int line;
     GString *hint;
 };
diff --git a/util/error.c b/util/error.c
index e5bcb7c0225..3449ecc0b92 100644
--- a/util/error.c
+++ b/util/error.c
@@ -24,8 +24,8 @@ Error *error_warn;
 static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
-        fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
-                err->func, err->src, err->line);
+        fprintf(stderr, "Unexpected error in %s() at %.*s:%d:\n",
+                err->func, err->src_len, err->src, err->line);
         error_report("%s", error_get_pretty(err));
         if (err->hint) {
             error_printf("%s", err->hint->str);
@@ -67,6 +67,7 @@ static void error_setv(Error **errp,
         g_free(msg);
     }
     err->err_class = err_class;
+    err->src_len = -1;
     err->src = src;
     err->line = line;
     err->func = func;
-- 
2.49.0


