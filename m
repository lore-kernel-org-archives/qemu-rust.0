Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A64CAC5BB
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:04:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmk-0005sB-1c; Wed, 01 Oct 2025 04:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmi-0005rW-UU
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmC-00068k-Rh
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLAzjRg81thfU2aBxeIBMEWinBk0XD4qCND6oGCuTHg=;
 b=BMxcs0juHbem6/TJt5Z9pe/VeNeOD17NfM7IzL/quvzW73NCzxrzOcCQfsW/GVOXtMcxWh
 vRJ3LoK8UhigxoykhBjtjaaURxn3EXO8fMQebDKjYFsOvHhl7hFHKuhnCOG2jnoH7NxV43
 QBUKGILuiuTPDvCvxtzoot7KjglZamY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-Ys-j2yxEPd-3xkmTsbRzHw-1; Wed, 01 Oct 2025 04:01:23 -0400
X-MC-Unique: Ys-j2yxEPd-3xkmTsbRzHw-1
X-Mimecast-MFC-AGG-ID: Ys-j2yxEPd-3xkmTsbRzHw_1759305683
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-632d1317f48so8004194a12.0
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305683; x=1759910483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLAzjRg81thfU2aBxeIBMEWinBk0XD4qCND6oGCuTHg=;
 b=cBZQdQOjJYMh97yyUGtcf22HlLQkBfR/h3w01/A2qB7ccDgZqyux1vM0TJC6vB+o64
 QVvFyJu9jefbUYEAczDWvXtUFBiobzYmUVMj6JfvutvL3BnHOdVe/P+34kiyjczcdete
 U8ZLpRpL2MWyG46fJDj5chbQlErpo11eJfs1IN9Nmi+7oTZzwuxc5SXbaiuVqkyJQc3E
 9JVNaEft4untPDPFrrsycjeuSwe38hJv57ScDPA1VayZg9Nsdvh+kKnZ9DMAkV4ize6h
 swHM/rA2pClRJ1/0kNB2G9ynDRN7BCV69hiJtIPy61nLsV8cnwEnG12m/Yw62HOFDiP9
 Y56w==
X-Gm-Message-State: AOJu0YzbrqIcBamFnVMYKo6ec29R7NbDHT2Eifn/K1eErYtzZlfXtM7e
 s6ROdqpglBM2PNN/+/LmeKWoZuGajaTz346BXTbmB1CvkO3vOvn2WCRsJAMz0uAgHNjJ7Hoj0Us
 ZsZe87VcQgOsdpYp/F/qOgM8kwj/UGu2MqAn5HjzxplcsvgSJohWhlG8=
X-Gm-Gg: ASbGnct7LxH1TgAEuzD/lMf5Xa72s5wxTKLr7akFppi9hcmToZqZerkZC1pD4rdSoWp
 DGVlX5FznQ1Fdw1Lb5qSYjzkB7JbJWXYR0PKWHDKfyBGOHZewa631Xw6HwlY5AKlSPZIdA1uPvC
 E8LuO09scD2DvCKMq1Ynb6MbwiI/nEtRfmtrzJX7CWQgf5pDZYZZMJyWvX8PsbbJJwUzr4NGylx
 3i38LN6yogPxRTkiVpU1R1xKkhHdbN3Woq95OejCInaP9BjjPvQ+fNRhbgi772a0B8hcA9UX79q
 DfcfV/V3g1mjuy25P9MABM47O7WGm1i93ah2d6Z+hRXeuJO6DLInUi/yvuxkHRyPtK/mgT6dIab
 dfVtifC0u0cafnsmapIXaYIncnB/7Onb9Eca0WWGBSSWLQ7drKB8=
X-Received: by 2002:a17:907:da5:b0:b41:8e8b:5511 with SMTP id
 a640c23a62f3a-b46e585d0cdmr314366566b.21.1759305682629; 
 Wed, 01 Oct 2025 01:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2p8hxBFSZvS+u8hwtc3bYA1wuLwOAQjRkgrNwDKcnE/ZqMAb64+QiThthVclVZXS651bgWw==
X-Received: by 2002:a17:907:da5:b0:b41:8e8b:5511 with SMTP id
 a640c23a62f3a-b46e585d0cdmr314362066b.21.1759305682147; 
 Wed, 01 Oct 2025 01:01:22 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3f57c9c2e2sm556156266b.68.2025.10.01.01.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:01:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 12/14] scripts/rustc_args: add --no-strict-cfg
Date: Wed,  1 Oct 2025 10:00:49 +0200
Message-ID: <20251001080051.1043944-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0e79qvl2VYFh5AH2gvuhU_1kJzXZte6oCNVFeEUFVSI_1759305683
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


