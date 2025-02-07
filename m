Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgPWV-0004ep-Ev
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 09:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgPWT-0004c5-L6
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 09:40:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgPWR-0004cW-Nf
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 09:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738939198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V4vYN424Zst0W94i5JbD8fyChMDv/Dgup2Y4cOwoh0g=;
 b=H22bgab7sXzVx7OiSya5cL+ACAD9Z0AtDHUeCCUEIIMlxkztWscCPzI2+7zk0raj1/ARE/
 8bBHRV2I9qFabveq9juG2qUxIM3vdwEIGzYJSJ5ZoDkOWUpzFfAOwqOW3GCW5TFl+9Kza8
 cQcoPvcnphKJuoigJ6PoXk5fy5EOc/0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-a27c_YVEOUC_yYnDTJ1_BA-1; Fri, 07 Feb 2025 09:39:57 -0500
X-MC-Unique: a27c_YVEOUC_yYnDTJ1_BA-1
X-Mimecast-MFC-AGG-ID: a27c_YVEOUC_yYnDTJ1_BA
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5d90a59999aso2400339a12.3
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 06:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738939196; x=1739543996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4vYN424Zst0W94i5JbD8fyChMDv/Dgup2Y4cOwoh0g=;
 b=JYYHKzuoo6e49q9lYxpA6Fb9Dt8jPyi0PDrgvwEEB8jsR539vsyBYdGfeTNj8gy5Dk
 zsJnO8JtyMgjwdqJUUxiSGdDiK7DAlkbRR6MZuJcRazOSWXPMJ1dveTSTrkBmfTYp3YJ
 o+fypuZ5/QnzEwzeb8/FQnuYGDmV2msnOHvXhtTGR5reI/Wqx2sSNcFq+bqFyviTTww3
 KHpSrz4IHdp/vukhXIiTtk84Jj+nc0QT0AteQHHqPlE0XeMiBMMPOWXtUGQpftXfYHgP
 YYA4pab9Jev8hYAuQmFEKLYt9n+nImb+Hp4N/Zv7hNhdt2pKgmSF/n9YSamzXnILGWx7
 iqgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvTusEiw3SJtp7BbrsEcTvxtiH7TCROz7azKY4NpZFP0ZuJmANNsYcJles6a/M4l1THotoaQMyfhg=@nongnu.org
X-Gm-Message-State: AOJu0Ywaxib4rfpx7r5yspYbrYIqBg8VvKUEWzNrcir+Q0BAOKMqGOeg
 GmrPFmBvsMjl1Ly+xsQ/yuFahF9os0AapgLUwNy2UPuizhvG3Z743J8Tz86zkDd21eR0hDpB6Uf
 t7Vvb0ag9+7qE0qcYcG5QdJLCamvOjL3fMROP9QvfiDpH/jnVuD3HWasg4AS0/Q==
X-Gm-Gg: ASbGncsiVoLmcFQQAlV3VYax+Bcv0xzZcymbmCNayKFXkEw9YagohbfpTEUh1SEJSNr
 a6feTR535n0nazwqdT42FiFwt+n7Kz40qChSWadceSV9oOZggUX7y1oAtGYuPR6ZuapLbKMM55d
 p8b/BRPq3o2zxy6HWpftRcXBFB9OwdUAI2kkkW2PhXKTWnBjkb3V9ROeNmNOG6tlK7DnupnzOzd
 U7/wwA7k+go5L+aBZ4SFiCGGO5Jhp7oYI0vRePldS8qZomxBPLmPkaGcai/Spr0ScMsexMNXDJp
 BPxCEQ==
X-Received: by 2002:a05:6402:e8a:b0:5dc:a44f:6ec4 with SMTP id
 4fb4d7f45d1cf-5de45018934mr4660812a12.13.1738939196200; 
 Fri, 07 Feb 2025 06:39:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt8z6hhClcKw+IkdWrfCzLuzskC5ay1gUIrxBvWYM48W9IW9cCggo44xDh4DzYCVksEsc9MA==
X-Received: by 2002:a05:6402:e8a:b0:5dc:a44f:6ec4 with SMTP id
 4fb4d7f45d1cf-5de45018934mr4660768a12.13.1738939195756; 
 Fri, 07 Feb 2025 06:39:55 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7ae65sm2549015a12.17.2025.02.07.06.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 06:39:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH] rust: restrict missing_const_for_fn to qemu_api crate
Date: Fri,  7 Feb 2025 15:39:52 +0100
Message-ID: <20250207143952.2486587-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tie-cvAk43Yy89ttKiNK5R5xG9abadJ90qGQTjOIjbQ_1738939197
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Fri, 07 Feb 2025 14:40:02 -0000

missing_const_for_fn is not necessarily useful or good.  For example in
a private API you can always add const later, and in a public API
it can be unnecessarily restrictive to annotate everything with const
(blocking further improvements to the API).

Nevertheless, QEMU turns it on because qemu_api uses const quite
aggressively and therefore it can be handy to have as much as possible
annotated with const.  Outside qemu_api though, not so much: devices
are self contained consumers and if there is nothing that could use
their functions in const contexts that were not anticipated.

Since missing_const_for_fn can be a bit noisy and trigger on trivial
functions that no one would ever call in const context, do not
turn it on everywhere and only keep it in qemu_api as a special case.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.toml          | 1 -
 rust/qemu-api/src/lib.rs | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 5b6b6ca4382..5b0cb559286 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -52,7 +52,6 @@ empty_structs_with_brackets = "deny"
 ignored_unit_patterns = "deny"
 implicit_clone = "deny"
 macro_use_imports = "deny"
-missing_const_for_fn = "deny"
 missing_safety_doc = "deny"
 multiple_crate_versions = "deny"
 mut_mut = "deny"
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index bfb6c6d6e42..20134d75ce5 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -4,6 +4,8 @@
 
 #![cfg_attr(not(MESON), doc = include_str!("../README.md"))]
 
+#![deny(clippy::missing_const_for_fn)]
+
 #[rustfmt::skip]
 pub mod bindings;
 
-- 
2.48.1


