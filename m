Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA2CC87FCB
	for <qemu-rust@archiver.kernel.org>; Mon,  4 Aug 2025 15:16:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uiwv8-0001wI-0d; Mon, 04 Aug 2025 11:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXQ-0005hp-7J
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:40 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXN-0002Yw-6Y
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:38 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-615398dc162so7814619a12.3
 for <qemu-rust@nongnu.org>; Mon, 04 Aug 2025 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754315256; x=1754920056; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LMgCrR6KlknYh+ENybJoq0RqAETuG6eMroYq7thwFcY=;
 b=sxOgOFjIyMhowtgPS6PXLRh8njZsIb7EhCo0m821r6F7KPlCHxsT4f4DqHjzkGlaGz
 V0Uagi6CoG/fQbqFQfaG796hSJg36uN/ZODv2q74wUN5JkFTo1qzOznShhOZgRzu9Xkg
 ns1PbY27rQheQj9tFhROvZYqSyHk/GvT6VGeA9QTrIVbK2Jc8uxPDG/TACR/FogOzdTG
 J7vMlqB4TpDo547+o1cC0YqOrUeWkSPLdbfZwxm2gYLf7jHebp7CoJebOtwM84tDyj4a
 JzYp7pqmo8BJzLWiAVN5ubaK+mkf5sBTe2iv5Z3cRyIJMLdC4gQn4cnD/4eBd1iQyAKf
 58Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754315256; x=1754920056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMgCrR6KlknYh+ENybJoq0RqAETuG6eMroYq7thwFcY=;
 b=tywGzPT2cj6dIkidfADBOu8+F7kDonF0BJRBrHqG9InFdIoMsoH8LkOmwLQ+bq28mw
 qzE+/HIx3Eh/Ia6ZQE+zoXl8HhgY+dArrXjSzNG3hELObejD6VNxvrt8yw6RdnCmoXw+
 po9FqKv2jTj6p9m+uJvbjDs1yJ7bqp+DWK2xShj8PNFn9OMOIYVE2Dmizq7VZifTU7kw
 4/EhZc3WosE5TxjOsk6Krb1ZlVwxziAgx5B9VUsHoU3skf+zSMhsXCGYauhNMLWtDnJu
 vxS4KSQKk8wNLwPCA6jGy1djB6Pv5i+q0cmwM+ilrDctik3iZEsYzRjMXN881XvintO/
 eROw==
X-Gm-Message-State: AOJu0YysmgNPIZVDTE/jGQi2gkV5xsbgrsoWpJZiYOEwM91erZxkpKJy
 gbcBjczVBmWhnzEQ+crZ5vWn2crNIBI5M0IRkjGjhbwXoBAHO2jVJWKH9gDKWT64DEc=
X-Gm-Gg: ASbGncsyGvKw0x0pGOEV2JMRyF1D9/TvCO1uw8Im/fT6SHPerU5gknitobAgbSvyh3i
 3ykYNxX/1usw4wox/LqSo4NIghlD/YOOvUrAxvrpIHG5pxyQ9yHaL3ekiNqvub+578A8hJzYUIR
 qDVRt8AD8HQ50tXP0PMwaroc+cTYFFc4ZS6AxzGhxqv6dx8iYbZR/crG2RFZMvM3Xy2MamYQZ15
 u0/PJTjwXgmvZFfzN8eCKt2YY5TRaER3G8wcwaFVMyi7xrT6zpGVgLWIPnvpRqf2r+C3nV49kCb
 T/b0+FMmP5fvT6bWVr2aZgkePQGpL6uGyVNe3I6YOzbEzUVbFEW1W/tlV/36ya6Vev7X7QW6zou
 9dhlJub/lIAtLYjZiN0cpJSNr4MPOZovMqgh2yUiMIkBYgXTPbEsurcuCp7JOGwwpOgU=
X-Google-Smtp-Source: AGHT+IFqOd9wQ9qUvXAzSSypDy8vF0aKHLWLlZv7VxJ/ZQ1eozu+WxLgzwynxPNhVI4/RJK6/T0AYw==
X-Received: by 2002:a05:6402:34c9:b0:615:a5d5:972c with SMTP id
 4fb4d7f45d1cf-615e6eb5b7emr8745017a12.6.1754315255602; 
 Mon, 04 Aug 2025 06:47:35 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441708.home.otenet.gr. [79.129.182.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f15d9fsm6850590a12.17.2025.08.04.06.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 06:47:35 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 04 Aug 2025 16:47:15 +0300
Subject: [PATCH RFC 2/5] rust/qemu-api/log: add Log::Trace variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-rust_trace-v1-2-b20cc16b0c51@linaro.org>
References: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
In-Reply-To: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 alex.bennee@linaro.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=pk38yZHd4Z7OGorg/EcCACOf8ud5WhK9Uhm8ny8k1HI=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9rTG56S3drWlExMnV5ejBVenhXL0ZTN3ZjQlBqCmlhd1AvaUtwMEdDejBFQjF5
 cWFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpDNTh3QUt
 DUkIzS2Nkd2YzNEowRklWRC85c0J0aGdCN0YrVllYaUhSK3liT2JNM3hEOENZay9GYndWOUpBeA
 pKY3VZUTlnU1ZrQWluM21UTDh1NGRaRmJHYlMrQmdhSUR5Ym5jMEg1TjlxaDRicno1VjBNYXZoY
 TVOVGZLOFc5CmZGWG5waktqTVVDYmJMZGZaZnhnUjZnaFlFRnlxQXZzakdiTW9MU2ExQjFFZ2FS
 Szh2eWhuSk45SGFHTFpSSGcKOWlDN25mZXZlbHVRUjh6Q1FoVGc0bkhuSHRLS0lvVjQyek5ZMGt
 1ek41eVZsWjY0aDJZTE4yY3BxVUZ6K0lERwp4Y29OcDlDNTZmQlZrVEMxYXRkcnVmRjd6Rm1Pek
 tFV0NZNmtabklBN3Zzdk5WOVNTekxveEpDYTFHcTVoQzRUCmZ1Qlh4RjBleDhoQmZsZGtpOVpHR
 lFoL3dWUEpjV3l5NGVZUTlOMFFheGordEM3dkZBMVpnWWhYZTFsOFN0SlEKSEZRS1d6SjNCRSsw
 OXVncWY1V0M5MjJiUWkrUllJa2ttNW9FaU8vR3Z2SUJkenU2b3AwQ0F5Y0w1UnRzVmdNdAp3aDY
 xUU5ORDVqVDZVdE9nWEZYL0JkVUl2aHcwZFRTN2VRTXNkQ0VTN0hQVE1EU3laSDVIQ0lLTjdWUn
 ZTUkVECnUwd3FRbzAxd29KZEdrYjVPejMrYkljeEQ1UkJrVDFKTDFrZmxQekV6Mkhtc3d5VTRDe
 GhHcW5TQXVqZndDQzMKNHhlRHVUb3Z5ckhka2liQlpDMDlCVnkxQ0xweGpCdHpxRkMrNnlIWndH
 RUFLUU1CLytDOEkvKzVtN29Va2RGMgpDa29xWnArRkxWNnF6WHd2eWZVY2c1cXA0TFprN3Y0NCt
 oaU5QZ0pQQ2NCSmQzMHFSYnU5aDdBNEdldmkxQUJDCmYvNWZNZz09Cj1obHdlCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 rust/qemu-api/src/log.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/qemu-api/src/log.rs b/rust/qemu-api/src/log.rs
index a441b8c1f2e61b6aba95a3679ca9c426ab890c19..750ff4b4d878fabeac0bc2b28d291db4b824c760 100644
--- a/rust/qemu-api/src/log.rs
+++ b/rust/qemu-api/src/log.rs
@@ -23,6 +23,10 @@ pub enum Log {
     /// Log guest access of unimplemented functionality.
     /// Corresponds to `LOG_UNIMP` in the C implementation.
     Unimp = bindings::LOG_UNIMP,
+
+    /// Log trace item.
+    /// Corresponds to `LOG_TRACE` in the C implementation.
+    Trace = bindings::LOG_TRACE,
 }
 
 /// A RAII guard for QEMU's logging infrastructure.  Creating the guard

-- 
2.47.2


