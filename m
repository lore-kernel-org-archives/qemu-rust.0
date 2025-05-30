Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKui7-0002UI-Rd
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKui6-0002TG-D8
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKui4-0004Zk-QD
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myOvVFZKA+ce91dh+2uxifrByBNZxhGHP7Vbe62GjBw=;
 b=gxJSKkGIqvDjEsJpkmVQkUxwzeZN9/800dQQoWlhufIOeu1aH1E0BYbA45LS9Hx3NuBT8z
 4G3pZdC5eai2x4UyZfe5ChYgSpeS9cdjVU1GMxQEKGKiIKM3j9E0kXNkCXenbqj2pNDb2S
 67Fgwjt1TXAW6Cy6Q/+ubddC0jBzNp4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-TgaNMj7sOGqVuG6aqAHyYQ-1; Fri, 30 May 2025 04:03:23 -0400
X-MC-Unique: TgaNMj7sOGqVuG6aqAHyYQ-1
X-Mimecast-MFC-AGG-ID: TgaNMj7sOGqVuG6aqAHyYQ_1748592202
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ac79e4764e5so181394866b.0
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592201; x=1749197001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myOvVFZKA+ce91dh+2uxifrByBNZxhGHP7Vbe62GjBw=;
 b=sVLuxE5rEOjjCaFxO9bSLlQLmtxOMEAq39+vVkNvepLpZeEjVncGugDEel7413GQLK
 DywEL5LjeD83Ts1dvIc0gyDti63a+U/Lqjmeue8QGuL5AUVjm2DSqWz5qL7aiYNZ+bnX
 QrKrqJfA2/BGw7YbgzR1KwGUScwM7HUXcYnQWHBQI7E++ipLUz2Q8V+lqiw+hFUjE8Ap
 2vedM/KVeB9hYy0dAsSX32bA3RZkZsMzzAh6jAZ6RaZ3NMXB1RAN3f7ffPrwQCuMb8l7
 Ao/vPCKpIuS2IhvRiRacWqzUnTScDSW6Xq9+dQXEa0X2SpcMb0QqUjB2BbMaR04vVUIY
 MxwQ==
X-Gm-Message-State: AOJu0YysEnKM9oMw4cmrtGEZuAELy1Pne6qG54xgyvCKPG/Nb3lYzODs
 Vzz/rCFS3EWoJPqJu9NW5+sdDEhHajHkxuHdXn2HhYYRilkWc8X7YkMXsmk70IJJUUaPvBYwzoO
 TauKDn1YUJFWkbEfhisi5A/oxiVfcS7ZOHCtc9WPmMKfmGNmUKRkrVJixzZxGmec=
X-Gm-Gg: ASbGnctxMWV1YVVirdMIWjpPU4MEpFCJKIS87izXHhW1x4+YhWaK8szQ/B7EtBtkJEG
 16knFPGIKZjs0GEIxuqulZraeUSwMlfwhMEkULMv5MK7zUhc5oJffq7N2qKI1OyvcDLsZ5SVlJE
 Xl7pr2aKSbQ1GO+Lnh8Kg0+5Pz4un0SGxyVGAsNJYCizdbojW8P0Q4ufdhglEpLsmcy4Lw/XWep
 DxW1CZrPRGt2ZkQhIUUWRi4OgNdVzBHfjB/9tCIK6arrGLkcBKgfWL0pmEalUpztM4aBYiuQfS/
 QcAkkFSpHnsBVyxUcEgdK6Ve
X-Received: by 2002:a17:906:478d:b0:ace:5461:81dd with SMTP id
 a640c23a62f3a-adb36b05802mr118173366b.3.1748592201551; 
 Fri, 30 May 2025 01:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGudTLYnNAM1SlXn1/5qLjhSkUub+t2LTPYnLarw/rLSgeYw9bvLuyVa3Da0r88P1XO23KT/A==
X-Received: by 2002:a17:906:478d:b0:ace:5461:81dd with SMTP id
 a640c23a62f3a-adb36b05802mr118166766b.3.1748592200534; 
 Fri, 30 May 2025 01:03:20 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad3a6ccsm279233966b.156.2025.05.30.01.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 05/14] util/error: make func optional
Date: Fri, 30 May 2025 10:02:57 +0200
Message-ID: <20250530080307.2055502-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8emnV0uYznAV8CfbrMC_3jD_PId3AQtX4hAznryQptk_1748592202
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Fri, 30 May 2025 08:03:26 -0000

The function name is not available in Rust, so make it optional.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/error.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/util/error.c b/util/error.c
index 3449ecc0b92..daea2142f30 100644
--- a/util/error.c
+++ b/util/error.c
@@ -24,8 +24,13 @@ Error *error_warn;
 static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
-        fprintf(stderr, "Unexpected error in %s() at %.*s:%d:\n",
-                err->func, err->src_len, err->src, err->line);
+        if (err->func) {
+            fprintf(stderr, "Unexpected error in %s() at %.*s:%d:\n",
+                    err->func, err->src_len, err->src, err->line);
+        } else {
+            fprintf(stderr, "Unexpected error at %.*s:%d:\n",
+		    err->src_len, err->src, err->line);
+        }
         error_report("%s", error_get_pretty(err));
         if (err->hint) {
             error_printf("%s", err->hint->str);
-- 
2.49.0


