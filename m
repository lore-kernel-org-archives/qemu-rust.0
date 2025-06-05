Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eW-00007s-6Z
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7e6-0007WQ-S8
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7e5-0001Mm-5X
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2/G/I18Ub2g4XeJAVy21hDOpNlIY9B+vDIlXLdnVeU=;
 b=Z2wmJ+AwSSqfBM1E7scqSxPEA72dF2p0k+6cfuSmB+X5txN/l/2KSHuGgSHXhenRphR4at
 KRSpqPLOt6xSZjFceERJ8j44Eypm52p7E916iAfyMC+OdP040xqEAY0s+MhUJeq/Kh1aqq
 cdU/vH0+vu0nCEFSPMW4yeVnUVK7PXY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-ZsqxnsDkPpyL9elUxyoBRQ-1; Thu, 05 Jun 2025 06:16:22 -0400
X-MC-Unique: ZsqxnsDkPpyL9elUxyoBRQ-1
X-Mimecast-MFC-AGG-ID: ZsqxnsDkPpyL9elUxyoBRQ_1749118582
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4ee113461so304713f8f.1
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118581; x=1749723381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2/G/I18Ub2g4XeJAVy21hDOpNlIY9B+vDIlXLdnVeU=;
 b=dviSm1knS0of0NKmc4hp9igaUCWiuF4kP/eGcKnk9THSc8fgY7LMrhEq5GvD+BG5DM
 Wv2aVTRg6q/JJ+w05ABvBwHeQhWRk88be3/GtTODbgB+khFhkZGuE8OqJSBTGjhLtrW7
 jJkmdBi3a/W4y/l0CkBhdYF8DbAjxJud4JSP6Lp1s8IBt7WRJj9hIkfywBLTjrhPBwav
 i1ygWYSDjqfoQoUK8WYxZ0zsiar2JLZl00ETyc6ZaHnyVwma8dwE8VPLjfqc+TeUb2PJ
 zGv0pQcRxRK1tjOffbOzQ+o6IH0mTTkwP9UBVlbQzbv+H/rhmRWgTsImGYiEj3pYO6Iq
 MODQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfD90Ku0BbGVPKnUQD+mlA1xOUeEJVBdwfGXqs5eISeaOTHjFl3WbGifHhgSA8KoOVusdxrB1W0TE=@nongnu.org
X-Gm-Message-State: AOJu0YwZW01zndZ7SZJ0dEL/8LETj60iq+68+TOmz37K5GpV1lg7UUMh
 PEMCTIky/V+1cMi5zrmp4jXCbtl1T6eBqCud3dHjuL18RmKjhgF2WgWZygcXhnbgBrVq0vkiXcE
 JHS++kFmbc7p0UJYAoIeC+YXh+Uq5fRPiJYAXQ2RNFkVbvzIL5atbQJM=
X-Gm-Gg: ASbGncsLWCagn7Ghwccm+AGhAJJNGbCVfDQUtgsPm8z/tTGlj46THFTz5jOFe7pt6hu
 zafdEaOvYQ0CBibnel/yV3M37DIm0Z8NUmUGmFG0EVYHftGz++OyPXDNSTH4KUIcEk0zkk42inG
 9AdPhGKgk6Y+/zox8DVKqB4d24DwzofGvvI3lXO+eNoPBPXEESHKqCID7DpxfRNeYUfUqsPgZCS
 r9Km8Y0KZ6hfJ5lEkJlf+qqp3gDeeqgjvVZtzn+m9mjAvwbYulgzaE1lEKJ0PB7VbWMncNORV86
 NE/fyU61sXNuFA==
X-Received: by 2002:a05:6000:178a:b0:3a5:1266:e9ce with SMTP id
 ffacd0b85a97d-3a51d96cfffmr5407101f8f.36.1749118581557; 
 Thu, 05 Jun 2025 03:16:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtRlP5OI/J7L/pYLg9MBXPQdHxg/DXcrykIZPgtzrujpMWWBR1Nybv967jyEx3qxLN3ejSqw==
X-Received: by 2002:a05:6000:178a:b0:3a5:1266:e9ce with SMTP id
 ffacd0b85a97d-3a51d96cfffmr5407074f8f.36.1749118581134; 
 Thu, 05 Jun 2025 03:16:21 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe73f3csm23676310f8f.42.2025.06.05.03.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:16:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 14/14] docs: update Rust module status
Date: Thu,  5 Jun 2025 12:15:43 +0200
Message-ID: <20250605101544.368953-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YCCPb2hPicJSEV-C3-OId1hC0Y2flNuY5ctPhm1W-Xo_1749118582
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:32 -0000

error is new; offset_of is gone.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 98803d5e8dd..67acd7d2867 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -160,10 +160,10 @@ module           status
 ``callbacks``    complete
 ``cell``         stable
 ``errno``        complete
+``error``        stable
 ``irq``          complete
 ``memory``       stable
 ``module``       complete
-``offset_of``    stable
 ``qdev``         stable
 ``qom``          stable
 ``sysbus``       stable
-- 
2.49.0


