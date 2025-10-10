Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFC0CCD185
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:17:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7EmY-0000h1-8y; Fri, 10 Oct 2025 11:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7EmU-0000dQ-Td
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Elk-0004Cm-Th
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLAzjRg81thfU2aBxeIBMEWinBk0XD4qCND6oGCuTHg=;
 b=Egy75i2lGxuObygMHFpJKwxKpaTfLvQexZMSu520Ofn9odcTsRa7Akaf9OYIrEgLtk0kcS
 lfFHVwcBxQ44taHfVLcElSrSPbbNNkt5drE9RbM/8fQHj/TQLSCYIH2ziCU1S7OmKlIvhu
 coY1PUdFXzprGoxhqwj09geQaZV8XyA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-Y8xqbpVaPgawU3rHmPKxHA-1; Fri, 10 Oct 2025 11:10:53 -0400
X-MC-Unique: Y8xqbpVaPgawU3rHmPKxHA-1
X-Mimecast-MFC-AGG-ID: Y8xqbpVaPgawU3rHmPKxHA_1760109052
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-afcb7338319so271228066b.0
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109051; x=1760713851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLAzjRg81thfU2aBxeIBMEWinBk0XD4qCND6oGCuTHg=;
 b=Krhy0qTLVtNL6g+BuZqmO3QPX5gCYosewE0vXChYXCrz1NR17aU2tQbUVabffGvpSn
 NTSpyf9BFiXTDdfXSWpxTVCpP6yL+7bywqlQDSoh5cVWqO16j3wNBAVvIyUK1H957RtO
 ubG71qRdA+ELlTjsTNzIOaTug28QYbxTE/R0eRasOw2zFBSzc1Ns5N/x8I3p/mqFxSr+
 V4NwJ+BFzlOpRXMxc+8lcVs6LCEBOZDh5H2sai+Z8z0wvBkHvnk7wuuMAYyiTIfRn/tw
 9cs8AadEmWYHMJuj0V65nVXZcwnqq/6f2AkDEpMe55T4lXkamD4t/kGMuEUo3iZOOfg/
 Yt/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/NTG906kVx7lNUdXo82cbxYNaZokyt6qrjNK0zoTFXpiTb/3bMvvHAtY/T/u4QuOCDRW1DND+tLc=@nongnu.org
X-Gm-Message-State: AOJu0Yzr8dNlF2cOXOZ9BMsO+VN/3yydN+4wbO1jB/+/JdEjO7hxHLVP
 6FF6k1J9mp0EHxzI7ETum3/aYi0iKVBnwnqOwcnvLpOICHUgsPMZU3FCRTdxalE1NwskKhnQYYW
 /055bovCnLitirwhxNFW0gonTq8e8Z4igNDwO2emMw1a5D3koIkTHvsqqYF3A7v8=
X-Gm-Gg: ASbGncurMq4OX8V2GxAnKgirKRlMDwhXqVnD2e7BLe2usCIrL7J8nEft3cD+WRaBq1F
 WOjtaCRY9r82gag7C/TRLtmhNrtiJCQ6p8RAzHFHoI+1sB7/SsB1rwL3y8bse9MFXszlysybZek
 FaeyLvgpJANDCrjJexx9gDH/r0xqIKjSKZwuL6hHnyCj448tDNMtZzhMCikqacmoUQUoiu+x+qV
 Xcw1e/434PAiqV5r+f2szOFF6g6rYq+e2+RjecPM3fUFkAVNhLMqqcZuaVHBi7BN9C/95L+deyE
 fvns4OuokfvTnHl0zCSloqigQugWgRc7ldjoeTUv7O1KYwH5UnMmt0JHurI2rYuU8rSqFfFYFYg
 0Ju2dqSB3PD8NudBRGAy1kQYKEjjGXrryjpHsjjOSISR/
X-Received: by 2002:a17:906:c144:b0:b49:b3ca:52b4 with SMTP id
 a640c23a62f3a-b50aab9d64amr1227764066b.23.1760109050809; 
 Fri, 10 Oct 2025 08:10:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5BpqB1n7IwGrSa3hxTlnzREuidDabK7inECo3W37egXG6QpbbHe8MINppXAIxIGHcsa7Kpg==
X-Received: by 2002:a17:906:c144:b0:b49:b3ca:52b4 with SMTP id
 a640c23a62f3a-b50aab9d64amr1227761266b.23.1760109050433; 
 Fri, 10 Oct 2025 08:10:50 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12978sm253961966b.44.2025.10.10.08.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 17/19] scripts/rustc_args: add --no-strict-cfg
Date: Fri, 10 Oct 2025 17:10:02 +0200
Message-ID: <20251010151006.791038-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DZqZ76bO1itHPoBqWgW6_HPckNDJp0PH55Bf_HgzVzs_1760109052
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Allow to generate all --cfg flags, regardless of Cargo.toml content.
We can't easily list and include all the features used by QAPI types.
Access via #[cfg()] then requires #![allow(unexpected_cfgs)].

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/rust/rustc_args.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/rust/rustc_args.py b/scripts/rust/rustc_args.py
index 63b0748e0d3..c70b95b8bed 100644
--- a/scripts/rust/rustc_args.py
+++ b/scripts/rust/rustc_args.py
@@ -116,7 +116,7 @@ def generate_lint_flags(cargo_toml: CargoTOML, strict_lints: bool) -> Iterable[s
         yield from lint.flags
 
 
-def generate_cfg_flags(header: str, cargo_toml: CargoTOML) -> Iterable[str]:
+def generate_cfg_flags(header: str, cargo_toml: Optional[CargoTOML]) -> Iterable[str]:
     """Converts defines from config[..].h headers to rustc --cfg flags."""
 
     with open(header, encoding="utf-8") as cfg:
@@ -125,8 +125,9 @@ def generate_cfg_flags(header: str, cargo_toml: CargoTOML) -> Iterable[str]:
     cfg_list = []
     for cfg in config:
         name = cfg[0]
-        if f'cfg({name})' not in cargo_toml.check_cfg:
-            continue
+        if cargo_toml:
+            if f'cfg({name})' not in cargo_toml.check_cfg:
+                continue
         if len(cfg) >= 2 and cfg[1] != "1":
             continue
         cfg_list.append("--cfg")
@@ -194,6 +195,13 @@ def main() -> None:
         help="apply stricter checks (for nightly Rust)",
         default=False,
     )
+    parser.add_argument(
+        "--no-strict-cfg",
+        help="only generate expected cfg",
+        action="store_false",
+        dest="strict_cfg",
+        default=True,
+    )
     args = parser.parse_args()
     if args.verbose:
         logging.basicConfig(level=logging.DEBUG)
@@ -224,7 +232,7 @@ def main() -> None:
                     print(f'cfg(feature,values("{feature}"))')
 
     for header in args.config_headers:
-        for tok in generate_cfg_flags(header, cargo_toml):
+        for tok in generate_cfg_flags(header, cargo_toml if args.strict_cfg else None):
             print(tok)
 
 
-- 
2.51.0


