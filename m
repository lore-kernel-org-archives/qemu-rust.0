Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlp-00039v-SV
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlT-0002yG-9j
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlQ-0007qm-01
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EGlhQGgpmM2dQVRCh7jBtvLfB+JtoZdp0/VjpnQkgc=;
 b=L7rEp7CaaZc2joeDn6Rt+YMlM0ejtZ8lXnZtHo7Mf9ioWwHZjG6MMFErCml5nlcq/bfvNP
 q+0GlHtQKkno1GkW9oMT6O8JZdee6YiLy1RD1xrsLF30WVpGNpnya4YWbvpKUXEIXO2s0O
 5WJD06ma+p7i3JnmbKQmS5iwQGAV2Kg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-dLfcRBYrOR6aUZbgMRnVAw-1; Mon, 26 May 2025 10:25:12 -0400
X-MC-Unique: dLfcRBYrOR6aUZbgMRnVAw-1
X-Mimecast-MFC-AGG-ID: dLfcRBYrOR6aUZbgMRnVAw_1748269511
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so13573955e9.0
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269511; x=1748874311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EGlhQGgpmM2dQVRCh7jBtvLfB+JtoZdp0/VjpnQkgc=;
 b=VE0N0mDkrIZ85OIdehojrKLh4w0YhmQVypA0TpT3ncViD7eRjt1yfzkCsOGwEWjPKN
 MG8R+5BYeVtTRzg2hpCQgpzlk2DcfWAFFrBQSqRuBd2vypPEsDasFxjysmq6U15rvhsd
 yAJUAopqA95kRyRfXhwK1syyW+U1BAO2h5SVu5f3I9gY//wPWy2a9tPYjB3vdagah2Sl
 TF/Qb4m++pQuOzmMZSWsqgg7UkAig4mpdm4VY0V1hhIZtsSASVg2wobohBGgJLBpIqnA
 miRWc3CK1Io/DgvJ+tD7bH3uZk6OO2tKmkGhVScLiHPxPldpuuPXlaG5PjG/mBePrwx4
 qgdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVned6/8heqqXMoDwUlwRQnyHNH3ylabs+lmG7mUImk/2o4W0Udf3rj7XzdRyK+vHNGN8bXFtCTXP0=@nongnu.org
X-Gm-Message-State: AOJu0Yy2dWnzUud+GlS4CezyNFkXXg1mBtwp7EEnBqRiPCQ+MS47yrz7
 9nmytGa/HzmWqGU6pwpekN+SsqD5Z78Ok4nxRuUlLoamHxR1nX+aB9aRDZ5PVrEAS735WeeZMHS
 ddnAv099FGQBrdBwUm2ZIYxntPfIIoD5jCHWvAIzg53DueXXtXEfmUr+kow/P3Wk=
X-Gm-Gg: ASbGncvbn8G4v5ceAhbbF9Kch3avvvYGJg+zmnSE9dj2hkhgtbSVoHmWMG1qb4g9qD6
 6PGY8ZysrW5hMrTtehBVsWW3VlMtFSWtEBb9bKJXz4uZZxa160iPxkvTPL5H6gn4nJtV9jRJl4Y
 jwT5t+m47s6bhOhObUdgMqCbsL+LM9TxMwV7OEvuiGEja6ZIb4+Fo1WQrxgAHo8Ktb+FU3Hw7gq
 U7Ix0HOrkOf3TSNWOWKUgDEkc9qIA9XBWTOScXbWY4KSdBp4DfO0Pzz0elaal6vWmwvvZLmqgtI
 5g3Srtn+Pedbfw==
X-Received: by 2002:a05:600c:5297:b0:44b:1f5b:8c85 with SMTP id
 5b1f17b1804b1-44c919e1690mr78095025e9.13.1748269510919; 
 Mon, 26 May 2025 07:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrf2JnDbM5/Xjo8vU4HZrsfTrlL6QdK7hPIzOHeUs3OcU2pEDbqB77ErRZz/tIY3keLU5t6Q==
X-Received: by 2002:a05:600c:5297:b0:44b:1f5b:8c85 with SMTP id
 5b1f17b1804b1-44c919e1690mr78094835e9.13.1748269510570; 
 Mon, 26 May 2025 07:25:10 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b29633sm251321115e9.8.2025.05.26.07.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 06/12] util/error: make func optional
Date: Mon, 26 May 2025 16:24:49 +0200
Message-ID: <20250526142455.1061519-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zgAF0A7RVYCJtYNfshIe1ub-4jKwtZ0m4aY4DpofqmQ_1748269511
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

The function name is not available in Rust, so make it optional.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/error.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/util/error.c b/util/error.c
index 6c1033eaba5..b977007faaf 100644
--- a/util/error.c
+++ b/util/error.c
@@ -29,8 +29,12 @@ static void error_handle(Error **errp, Error *err)
             /* No need to free it, the program will abort very soon...  */
             src = g_strndup(err->src, err->src_len);
         }
-        fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
-                err->func, src, err->line);
+        if (err->func) {
+            fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
+                    err->func, src, err->line);
+        } else {
+            fprintf(stderr, "Unexpected error at %s:%d:\n", src, err->line);
+        }
         error_report("%s", error_get_pretty(err));
         if (err->hint) {
             error_printf("%s", err->hint->str);
-- 
2.49.0


