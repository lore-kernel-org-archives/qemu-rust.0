Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrm2-0004Zn-Ar
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrlE-0003lF-Dy
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrlA-0005zW-6L
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MCBJ5xtAP2sEtwZTxecdsarRiNYOTzsPMvNmsHN5qM=;
 b=cdBd974Bz/hO1oAPhdCz4qt6850wRuDtpOnqLMtfcpChefdhfVKpNtpsIptjVeTbwnLbbx
 aAfCLFTmh1QyfWxw6hlCsx1GR5pgY9QfY/3Njkd4bIMlPalRcybkf3MZ8Kt9vf0gWbuyjd
 lI0NO3vYHnALlzqq0TyNxlxbmmWPKQQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-fIgmoVmdMtqF9JV_mAjtdg-1; Mon, 05 May 2025 05:05:09 -0400
X-MC-Unique: fIgmoVmdMtqF9JV_mAjtdg-1
X-Mimecast-MFC-AGG-ID: fIgmoVmdMtqF9JV_mAjtdg_1746435908
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ea256f039so31669395e9.0
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435907; x=1747040707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0MCBJ5xtAP2sEtwZTxecdsarRiNYOTzsPMvNmsHN5qM=;
 b=WBfsazmuc8A0zGOsYbe9+if3y0jOP4+1X8mv2icnfiwxHYP+o9SiHSQ7jo4+UAht8h
 UuZlF+E5LNltRHWHiXFdyE3yKkwy+InmTzHrOBp+LjT1JB4b+Np3eV/uppoeWYSuOweV
 5ckvIeD5KcKeBfj8oGFc4IM+/ZCgHLOYmxq0eKDlhwkqaK9I1A1AVrTZLxhR3E2YMgFp
 rB1yNUm58jiu4/345/hn8edAoDQIPDTvhveKc6pNNMnhZbnrx4HlBhWS7jw4LIgMReIY
 gMOTVpgLKZ0K4FuFJ2T2tpX1Fk3GwaAYqoBOUFPBk+2CY546KpEgPV2FbwbtBDDc64bI
 i0fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/UurxdJKVcUFw4sMbINGMnmwxbpSGfdgHF0SNjSr8xOLbNmdx9glzXlWRqYsU2eAOyWkvkvRjgbk=@nongnu.org
X-Gm-Message-State: AOJu0Ywf39bQ4PX1iZKgjNewYf2fERQRnnhR/2a7tHCJIFCVrG7KJsuU
 dLRKhtH7rVOvofP7p0lkFwsh1w1wD2mbyhbfwzAlA7kVYfXWBm4hVtg2VwWKYpriJqJBk+KWX73
 8JassIziaCF/j8boExnuXH9FS63DGr7rppvZPNWIgdJ/cKB+0wHA=
X-Gm-Gg: ASbGncvqbbZA0wtI/VSpR+3q4sZfq0YqU4BlwWKpKTzyUJHfzqBm6JQ761BiL4rkNPf
 Y4gVXH4OCDTyYsiGmKbEpszjgZtgTlkROmVept0SeUH2lPzUk8PWSYGeFq1xiWyKko5iOL/D+YV
 hQtZEZOPAWETetmB//qikhOGZ11ROZsr4DhSV0qweN9oujU7u+v0FwHkDc1dwxPJBYa/BNzGMhJ
 lQBjzAomfpUceXF8vxpxp0mfiM01GgZkz+h0J4cs37Y562CtoeE0xcpljYjWiF3HHZpOozRlAx0
 wWMsRtSnpAPm1E8=
X-Received: by 2002:a5d:5f4c:0:b0:39c:2688:6edf with SMTP id
 ffacd0b85a97d-3a09fd879f5mr4757518f8f.14.1746435907663; 
 Mon, 05 May 2025 02:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPfOM+qiJU7HatBpa2hM+iVm4GQzW/ZoZETd4upzkhvkbf8z/Wgti0K0h0gtlBbNcQ2zL3Sg==
X-Received: by 2002:a5d:5f4c:0:b0:39c:2688:6edf with SMTP id
 ffacd0b85a97d-3a09fd879f5mr4757497f8f.14.1746435907318; 
 Mon, 05 May 2025 02:05:07 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae8117sm9871638f8f.56.2025.05.05.02.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:05:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 11/11] docs: rust: update for newer minimum supported version
Date: Mon,  5 May 2025 11:04:36 +0200
Message-ID: <20250505090438.24992-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505090438.24992-1-pbonzini@redhat.com>
References: <20250505090438.24992-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 11xSRSBX1D-Uo_ASqKzw2wnIpELcQUIb1U6Xl70i4sA_1746435908
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 05 May 2025 09:05:27 -0000

Remove leftover notes for Rust changes between 1.63.0 and 1.77.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 557cee72f39..4de86375021 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -71,16 +71,9 @@ Building Rust code with ``--enable-modules`` is not supported yet.
 Supported tools
 '''''''''''''''
 
-QEMU supports rustc version 1.63.0 and newer.  Notably, the following features
+QEMU supports rustc version 1.77.0 and newer.  Notably, the following features
 are missing:
 
-* Generic Associated Types (1.65.0)
-
-* ``CStr::from_bytes_with_nul()`` as a ``const`` function (1.72.0).
-
-* "Return position ``impl Trait`` in Traits" (1.75.0, blocker for including
-  the pinned-init create).
-
 * inline const expression (stable in 1.79.0), currently worked around with
   associated constants in the ``FnCall`` trait.
 
@@ -105,12 +98,6 @@ are missing:
 
 __ https://github.com/rust-lang/rust/pull/125258
 
-It is expected that QEMU will advance its minimum supported version of
-rustc to 1.77.0 as soon as possible; as of January 2025, blockers
-for that right now are Debian bookworm and 32-bit MIPS processors.
-This unfortunately means that references to statics in constants will
-remain an issue.
-
 QEMU also supports version 0.60.x of bindgen, which is missing option
 ``--generate-cstr``.  This option requires version 0.66.x and will
 be adopted as soon as supporting these older versions is not necessary
-- 
2.49.0


