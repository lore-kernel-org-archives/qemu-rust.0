Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25EC87FCB
	for <qemu-rust@archiver.kernel.org>; Mon,  4 Aug 2025 15:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uix1Q-0003qT-Vq; Mon, 04 Aug 2025 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXR-0005ol-Qd
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:45 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXP-0002Zl-UO
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:41 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-af66d49daffso572781266b.1
 for <qemu-rust@nongnu.org>; Mon, 04 Aug 2025 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754315258; x=1754920058; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wbu96umnDhrqnXsA31ZGGYO94kVucZ/SNX5BmpI69LY=;
 b=Kq383Ha8qfbAnYYymHd2rrcFALceZU+VIzIcKBWC+9oy0gh8/pN3azIUyM3NTwsVOK
 DRYE/M6yUzLqzuwBscTSz7f4WLQBcTiJnfvpXILHYmFbirE/EKLcV8EfefPld+emm8IX
 nVl0V6M10bCQlumi1jRP01ix6p02bcGv6kf16nt0VJnZEWG1GsPwaArHb9DGw6pqmGPO
 DRdIm/wSJknq2a0tYQWSzvxaDY9JOCjpAjQ8Jfd5G11gKanmzYyXqhfiDtFI0loBZeMf
 hnRDhK9AakxpqPm9O0Hmz1GImnm/oVVxNLR/kCZdSN1eufy3pSxBecG/bNO8FBXGGo0P
 znQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754315258; x=1754920058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wbu96umnDhrqnXsA31ZGGYO94kVucZ/SNX5BmpI69LY=;
 b=ELd3KHi3D8tXvH+WBAwughrtTLPTeOB5ehUwZgyxpogQdZi+KOZMtC6YUyfr2/ZApQ
 fw5t2M6pnPrugvHWDZ0fEBVpJVIGpPZy+haqnmYGiz9TxQO4NO9cWiLlp4p51OO+AH+z
 Knj7dLfCsJhW6N9FqaRhQSsnhqxnzOun3NDMmc/FepuKD83qEYP4VCSZCCznk0YahyBY
 NkAUZlOlgyxmok8jkBX/TcKCqOS4vK7d2nHjnBpSrjfWINFtt3WlUmqS/MRPMpAjyEpL
 B0bkFs2ATnf7TOp+kEfzUzMHJx3Jy7t//+PFT7aoa1BfPiBRfs27x0xYCZF3SMgD7FVQ
 PRjw==
X-Gm-Message-State: AOJu0YzxzQwMwqoTcy9P57RDl+GjG6kVNd87tPMWshm8HyXpIq6kQTzX
 libkWBtxomq0a9Wn9N+ORJ5WqLkav8VNBq5DGB+FBsHmS9z4cn1SoR7lZSANZeSrFnc=
X-Gm-Gg: ASbGncu3vo+uraIKAJHJfTlJkHQfGfS+PNKVSomvlT4GzI98Lk37M8KspNktrJZI7MU
 pd+qb0H3lDzc0oQ3JziLwYLZwh/MCH+HMBxEapQpuEYdoMMEYHqrOYTSBh/V5X/kzfV2Zhgr+ON
 KONddfgxKFskOwfAU7lVCc1UHvW3tXRCLQPE3nZIouDrDw0YLNITOqP0HQqg06hnl94uSyR5FVT
 CD/qzkXtCG8YdvIHwWCGD5Hu0QJx0/7UaydN3kLvT7SBgzJesX2tO/JZ75ynK5fjOQmTFaQDPCa
 fDouEVzQGoIl2Fot+K7sNaioPXFvq0HmpSehkwBHT9Y4x4VskDW43tjm+2WYmJXB+OtPZhrU+KW
 /jCRDZbq9/szbqEzNakx6c0lxLNU1EO1B7flHDW38turCGdkgivIDALsWh1m4gjvwQorwldT7of
 +gZA==
X-Google-Smtp-Source: AGHT+IGeok3AT9EM5+EyEyOC1yWlkSGisfJyqDb8TV7it5uIabJl3zpJ1FNVKBjSCLqIyEWa8p6aug==
X-Received: by 2002:a17:907:d86:b0:aec:f8bb:abeb with SMTP id
 a640c23a62f3a-af9401c3223mr940541166b.42.1754315257893; 
 Mon, 04 Aug 2025 06:47:37 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441708.home.otenet.gr. [79.129.182.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f15d9fsm6850590a12.17.2025.08.04.06.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 06:47:37 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 04 Aug 2025 16:47:17 +0300
Subject: [PATCH RFC 4/5] rust/pl011: impl Copy, Clone for RegisterOffset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-rust_trace-v1-4-b20cc16b0c51@linaro.org>
References: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
In-Reply-To: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 alex.bennee@linaro.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=Om9Apvwjl3yaG2PEd/tsN7AFucqCNXgbE+oPqw1/2PM=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9rTG4wdmI5R2VIb1FQZmpUdWRiWHBlSkxnd2lqCktlQUVUNnR5aHRXOEVXdXFC
 MTJKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpDNTlBQUt
 DUkIzS2Nkd2YzNEowR2tURC85c08yY2hEN3AwS2dCaGgzTUtWY09mU3lXRjAwWXMyL1ZHazZVTA
 o0aWdWblVCNTAzQ05FL0oyaTNCbDBMNmdJbjVnbEtva05LczBWem9waEhBKzRrRkRsSkpNc0ZRZ
 2pEVDIyRVFjClpFU3Rsd2IrYUxsV0hXczdzMW1vcStHOFNOUnBNRHc2SzRzcW9GTXZ6bXVyc3Nv
 Q25EVkNiRlRwZkJoNUh1aVMKMFcwR0Jwb09hdjV2SnlaaEVBdFpmZ0V2R3FrenhiNHF2bENqUDd
 tcUYvMURkSzNGZExUbkRkc0R6a3I5eG9sZwpLOG1oWWJ3T004SkRKZ1JtVEZTZGNPbzBsL01CVW
 Jla0dVUWQ5cFBZQ3UxUWhINFlHbFlTUVpIcmYwTzBnTVpUCmo3SlVsMkRlUlVQZUtpd084aklwQ
 VdsODlJbHEwaVNrc0VsVmQvY3BhZE5CcGJ4eEllbmFvNmw4UFZvdEhHTjQKbkNwa2V1eXlVM0w5
 RHdhTUNkVUcxMElwQkJ6Vzh1LzJhU3J1WnJ5VXZNUWpnT0o5RFR0dzByOE92ZWltaUlNcApZdWd
 kZFNxSXFiRW9aN2tXOGdJWDZQVHpjSENMSzZsM3hkaUJLWXZVRGY5LzNPSzVad3NrT1ZzeDVVcU
 V5dUJmCjZiVksydHQxdU5Ea041amFWVm92bU1vUExyTm10MExHREM1ajI3aUlLYS9sN21VcEtKZ
 WFoeTJaRUtpL0pycFkKYm9Jdm1rNFZEczBJMWJINTBtV0VHNGE3TXpOMnlMOVN0OGUzaEJrWmZj
 bDhZOEkxSkJNVlRiblYrYXZKWkk2dwo5elZTYzM5cFJjY0ZJTC9CS2V0UWZ1YVVBUkVPQjEvQ0p
 JUVQvTFBBMTRPVnhIOEpLbE1UMEZzZXpxWk01MnJLCnZNUFNDdz09Cj1OQWlKCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 rust/hw/char/pl011/src/registers.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/hw/char/pl011/src/registers.rs b/rust/hw/char/pl011/src/registers.rs
index 7ececd39f8616e0b1dee999bbe31dc5dc70e209e..3201932daf8f4a71d95374073c4c259698dec2bb 100644
--- a/rust/hw/char/pl011/src/registers.rs
+++ b/rust/hw/char/pl011/src/registers.rs
@@ -16,7 +16,7 @@
 #[doc(alias = "offset")]
 #[allow(non_camel_case_types)]
 #[repr(u64)]
-#[derive(Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
+#[derive(Copy, Clone, Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
 pub enum RegisterOffset {
     /// Data Register
     ///

-- 
2.47.2


