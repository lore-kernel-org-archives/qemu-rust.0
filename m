Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlt-0003FP-To
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlQ-0002wp-8Y
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlN-0007qa-CC
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpYGntv438dYQNUhSbgUIEWdF1v1wrR4ORdQOzf6Qfw=;
 b=IoTZ6FkI7IKJGY+BmRJ4VGKTHOTB2sa9fOWvXQBThgsjn/OxOv+hGGEflU37zqFMYMarCg
 OcJfo54H3c2lf/t0ghaoTWgJwXmfrpIHT2XXSgrZi2+pCLgdmz9un6uqJ0wKJFj8V6fnMw
 5y7KhsQAePH91Zpw4RR7zfp84uirg3A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-QOEdd39tPO-bG0UgioF6Dw-1; Mon, 26 May 2025 10:25:10 -0400
X-MC-Unique: QOEdd39tPO-bG0UgioF6Dw-1
X-Mimecast-MFC-AGG-ID: QOEdd39tPO-bG0UgioF6Dw_1748269509
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4d51e563eso517951f8f.3
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269509; x=1748874309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpYGntv438dYQNUhSbgUIEWdF1v1wrR4ORdQOzf6Qfw=;
 b=XcYfsWU9ReUTW8zPeJys+kEgJtPE7khY9VU3lZYveD3cWzymw+8SeP19zmCxIteuZ/
 icxIm28TBLPRWZs1PDhhhL4eN+Tu6XvAOhjq+5K4CX+NinP3nVVBK1EmNxLN5B70boH7
 eNbj0KqHYKYCpRbMwj748UcvYnKosr5LxYGduJV7vUjD5ybvrG2EyYlk/t8ngFfJBEAI
 MILmi/fpS9r/8pvQ0ZllsPJbGLPGMb9V4SE+zrEzQj3kOrukfMkEiKZpYfatigYcja39
 U/+ZpoDDuSRuwpeZSYnxoW5tpVXlY/jrHNv6yY38wULmYyhSHvqGqeAC0UvCh1whn4v0
 +GjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxuEdQbAgnb1/kWzj0n6Txe4EaMvsKu6/dovpdWO9RlXAekboTYYa9BRCpTlf2OJd9Nxz/RxMd20U=@nongnu.org
X-Gm-Message-State: AOJu0Yw6qYtFU4E5tgIns9wAeCSepTDhU/ZOGyxFjuYWXLr6pvQqkP53
 8ST94rpucQz6rBDrRsTyFEBp18gU0xl0CodJNT1b928doJyZkoyZMLUhdxnUj910Z2jUTQP1pHO
 meB0cCww7/DwveLbU5UnTtzvEVI2XYy+l6Y+HAFozCcJU6EYhRH7tSoM=
X-Gm-Gg: ASbGncuDvMLCXeIt5OGMUHc0KiJIjjDyi8/eE1nfcOgdoZaI2bwJjA0rsPgJi37/MPB
 QjT9e8vY0sk1zkQ7xNQyJGyatzer5DJD9kcUhit8HPhdMt3j8zRDvKEKxwe6b9wAC+UOKQPAtqq
 XbDZeqHnjOrsf83Pjl5Wom1NRsldKOdLkL7qDHcUEJWh2A5PvJH8/Rh2kL5EYuGprh6zRYUvW+2
 lhFk52y2w4g6Q5mMPLzJQBOXjp4DWssHC8xcthQV4WQtn82v0XRHyWfYPEDarbfEHUOzuIHwViF
 xHiamWSmHM4O/Q==
X-Received: by 2002:a05:6000:1785:b0:3a3:6415:96c8 with SMTP id
 ffacd0b85a97d-3a4cb49dea3mr7153158f8f.41.1748269508769; 
 Mon, 26 May 2025 07:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETdttXPnZfK3l9FdiP+86UXu7Z77XeMloT+ILBa2OzcxJ3YSS6IjjsnMqJXILplkExEN6PpQ==
X-Received: by 2002:a05:6000:1785:b0:3a3:6415:96c8 with SMTP id
 ffacd0b85a97d-3a4cb49dea3mr7153137f8f.41.1748269508389; 
 Mon, 26 May 2025 07:25:08 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4db4e6f15sm2342195f8f.81.2025.05.26.07.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 05/12] util/error: allow non-NUL-terminated err->src
Date: Mon, 26 May 2025 16:24:48 +0200
Message-ID: <20250526142455.1061519-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ony-O9mlhN8K7z_m7QKd3SrZtshYfFxbSnSpKlhYiP0_1748269509
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
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
X-List-Received-Date: Mon, 26 May 2025 14:25:31 -0000

Rust makes the current file available as a statically-allocated string,
but without a NUL terminator.  Allow this by storing an optional maximum
length in the Error.

Note that for portability I am not relying on fprintf's precision
specifier not accessing memory beyond what will be printed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/error-internal.h | 1 +
 util/error.c                  | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/qapi/error-internal.h b/include/qapi/error-internal.h
index d5c3904adec..6178ce4a63d 100644
--- a/include/qapi/error-internal.h
+++ b/include/qapi/error-internal.h
@@ -19,6 +19,7 @@ struct Error
     char *msg;
     ErrorClass err_class;
     const char *src, *func;
+    ssize_t src_len;
     int line;
     GString *hint;
 };
diff --git a/util/error.c b/util/error.c
index e5bcb7c0225..6c1033eaba5 100644
--- a/util/error.c
+++ b/util/error.c
@@ -24,8 +24,13 @@ Error *error_warn;
 static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
+        const char *src = err->src;
+        if (err->src_len >= 0) {
+            /* No need to free it, the program will abort very soon...  */
+            src = g_strndup(err->src, err->src_len);
+        }
         fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
-                err->func, err->src, err->line);
+                err->func, src, err->line);
         error_report("%s", error_get_pretty(err));
         if (err->hint) {
             error_printf("%s", err->hint->str);
@@ -67,6 +72,7 @@ static void error_setv(Error **errp,
         g_free(msg);
     }
     err->err_class = err_class;
+    err->src_len = -1;
     err->src = src;
     err->line = line;
     err->func = func;
-- 
2.49.0


