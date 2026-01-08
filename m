Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE1CD185F2
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpnW-0007z5-CY; Thu, 08 Jan 2026 08:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnV-0007t6-8x
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnT-00083R-AO
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69DigzWj4ZfxAoDrRrcKXKL2TbKieDPgsraALABmsSU=;
 b=Uu+juvI3ghaA7HGEpD1vbOcQ2NLRyOWvnhBD0eWt6XyI8hjnyDvbsQZC+/iIfW41M4/nna
 V+YGdlBNCODQE8MUKMpamEts9YfoO672kUVnWjhRvcPlg+Uxq3f2GiVNzPEnZs/dvJFZ8p
 P/9gO4UgdlfVl3yS1bIjS3/GxV0uqWw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-QZkxtLkSNfOLDrugcq40Ng-1; Thu, 08 Jan 2026 08:11:25 -0500
X-MC-Unique: QZkxtLkSNfOLDrugcq40Ng-1
X-Mimecast-MFC-AGG-ID: QZkxtLkSNfOLDrugcq40Ng_1767877884
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477cf2230c8so30186135e9.0
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877882; x=1768482682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=69DigzWj4ZfxAoDrRrcKXKL2TbKieDPgsraALABmsSU=;
 b=faPEU4XHlQpOQRjTGpAIkVyG1ebyryZPcN7OJucpc58MdD1mGPQA2ttLqS7LvjwO7S
 VfYxerr7yjhiOIJeEMt74dpFDibjqjapjz8pP6AfxH62GVp1hLNKJKXmUgUg9YOlmAXO
 JbrA99/qoB2DB5nnphJTW9fZ+0MjO/imY0SsFb54wRsxoJupr2jyU2hpgUa+KrptzOgt
 UkPIPdmDsevTK5V/KYeJbZDg8JBxeRhSqHe6mYSrP8NOQn38/tFr97tUKmkFO/1vYBLH
 MzZMn/TkBfP6ucKbEnyT0pS2ciaQvYOTVas+pUuKP6guwT0RrYKkSoARufrxa1L0/won
 zEUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ25ZlJpulI8oSSTr2E8hpJZyWgNmReV7bbZPkrpeDczX8u8oaybB5T0VkeyOFv+iy9uVcd3/PzmA=@nongnu.org
X-Gm-Message-State: AOJu0YyacTKOi4u3gk38OGnh4+2YtyMP1/7CyVeEa6ki55ti66HQzbwA
 0jg0dZFhSrVzv6WJh3p1eoDkEKBIj2HqLZ93rYW0u1ITs6Cwh2PemO4hS81xT8LmqkFd3T0IZj8
 BJ9xhF0HNbGYvpKkyEPRdK8hCLYk7Ojh3ssfc5meo0/UNwtuM359zrk4=
X-Gm-Gg: AY/fxX5HCfH8tzOS2uaAes2SKHxinaleL/9mSCAHoF029aLEZiYQNaJcgT/zJ/+gUX4
 3uNwsgWr6XlDgetS6AaATfteTWJ/GoX/icVJpWTDYr4BYDrnHXbkwFDhr3n4s87ss8SyqOkAbCD
 Ul2oFIOh+EN+toeh1EaBiIdMf4b9EjGXGGiBtJ4HkE3cnWkWnPJg4fWUp2QGuu+a58MVYMypG9G
 n0SpwdX7cbzmP7AZNsRdASYfXjgXzA9yt9RjE2/Ru+R8vNDyuDZdbzKB61RyE7cPLIvah/fZ9fv
 5bP+1VK/XC76M0kwQCNBWQuBINkYqkCRbmw/xrHAkTuI/u69QKzsIJGphuKZ/aVbprQOiVEYKuX
 8fO+WtCfI50UJhkaS0lbxUCMBhXeBZuw+BlJD8CNG/keIXd7QV6F1r+zY00nrL6a2bD2Fe8kPtH
 bKJl5tAwVtWH0ltg==
X-Received: by 2002:a05:600c:630f:b0:47d:5d27:2a7f with SMTP id
 5b1f17b1804b1-47d84b38534mr67895455e9.26.1767877882362; 
 Thu, 08 Jan 2026 05:11:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZRkwS4JBE3z+OEyFzuopJCLYfolNYNYO+oOKcKdPqfFgMR4KlXOfmyc7/a34yqGzdx8kYEA==
X-Received: by 2002:a05:600c:630f:b0:47d:5d27:2a7f with SMTP id
 5b1f17b1804b1-47d84b38534mr67895205e9.26.1767877881966; 
 Thu, 08 Jan 2026 05:11:21 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f410c6csm163484795e9.1.2026.01.08.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:11:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 13/16] scripts/rustc_args: add --no-strict-cfg
Date: Thu,  8 Jan 2026 14:10:40 +0100
Message-ID: <20260108131043.490084-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DE9Gim25tHC8wO-lkDU3Km4f1nnj2yJBJu_F2lJNEJk_1767877884
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 8098053720a..6a156b9608e 100644
--- a/scripts/rust/rustc_args.py
+++ b/scripts/rust/rustc_args.py
@@ -108,7 +108,7 @@ def generate_lint_flags(cargo_toml: CargoTOML) -> Iterable[str]:
         yield from lint.flags
 
 
-def generate_cfg_flags(header: str, cargo_toml: CargoTOML) -> Iterable[str]:
+def generate_cfg_flags(header: str, cargo_toml: Optional[CargoTOML]) -> Iterable[str]:
     """Converts defines from config[..].h headers to rustc --cfg flags."""
 
     with open(header, encoding="utf-8") as cfg:
@@ -117,8 +117,9 @@ def generate_cfg_flags(header: str, cargo_toml: CargoTOML) -> Iterable[str]:
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
@@ -179,6 +180,13 @@ def main() -> None:
         required=False,
         default="1.0.0",
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
@@ -209,7 +217,7 @@ def main() -> None:
                     print(f'cfg(feature,values("{feature}"))')
 
     for header in args.config_headers:
-        for tok in generate_cfg_flags(header, cargo_toml):
+        for tok in generate_cfg_flags(header, cargo_toml if args.strict_cfg else None):
             print(tok)
 
 
-- 
2.52.0


