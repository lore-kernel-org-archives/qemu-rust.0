Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E51C87FCA
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 13:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk0GJ-0002Cs-0n; Thu, 07 Aug 2025 09:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uk0GD-00028O-AF
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:02:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uk0GA-0006tp-4Y
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:02:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso9712445e9.2
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754571735; x=1755176535; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Cu9VJ2G8pODrK0GcoOi2CvsmQSsPUqkZ+nRhmsTmMU8=;
 b=tD5MawJt5G2FoZppGIg8UdM/K4wzf263N1aMDC5rhOzn8RvF9fxaeXIGh+RsXqzbe/
 3L7cGhiXDL5Rv2i6y2J66VaUuusOIh2GxO5uH13zMaSQp0gxY18204+pgFnKXRb0ajUk
 cRWk2cFEC817C1dslaGeo5SKZT/8wUP/9UB0Kz2Br2q3jxEod4LEpIfSaHna47k/hM/y
 vCb6XpjWKWmf4JtkK1akz1M25G/GUiE2/rH9IziCk8yHeLyVk/x4D0WlUJKgbS2WgjEJ
 zQtmV6JtFSLlZw/9Zmwe3l5MO9uhGJeiS+qHJiTtzlz0K3Zz2RGEqzaitqox2wPmJ60j
 4h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754571735; x=1755176535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cu9VJ2G8pODrK0GcoOi2CvsmQSsPUqkZ+nRhmsTmMU8=;
 b=AyJm30A9hD8F4fJndgXEtkRbIDlJgxNxyfIl5UC+QHrA5lbjbRc6MD5ubj2VmnpTgF
 80t/7syNpwEDts+yxHAifvh97Pss7fLwqVAQHBmmyrpNZT1cR166ql+xrRDo4xUcnyv7
 LBuwbpf6hm9A/0q1Sv1t//uNfmhk3EPAJfrtPBhjxYLO0IFQb0vwGMRPO+0J4YR4H68b
 a3YoTCKlRzpgDBL7RvmLG2KPUV2hRdwcXfsFJzafJ694niGFRXpmR1GfLay541gHj9aM
 D4u9kfyP/Z2FvXgvJ+VdMGfrObbX+UwZ9juiwNYKyaShhzwO+Eb1uIXrVt3hcqZKamkw
 rlUw==
X-Gm-Message-State: AOJu0YwqtSCm5m37sbiryJrC1YjcKPZDrZkBPbLrbRE/2inGrXNonyw+
 qD3sZprkhJzYt1tpe9SllsbltnzNix7cKV5v7MhAk9ZV3YRH+7kPWcURvondHtI2Abs=
X-Gm-Gg: ASbGncvcUAMtL1g7GwSlqzIvqTmkPTVdwmY6/J8Cb9AwEzyuE6i3URs7/VvQshkR4RP
 PDMocdGt7XpE9JMMRl/kAh6RFe9PPwgGmG2qBnQSAHg8m84NArz3QpJMHmVuiZ75d/lf5S59SVu
 95iMGvEoCaEzRsDyWtmhpQa7fSQOs8pwzznADmP+bmS61ECsIXebaI3SPAtZZtTVwoe6DyXWPiy
 U/JdZ2z1IP7eJeR/AID++56Z0HwFeeJVMAiWUjmJzgX4Te3Wo15IQJLxJkQEwg7H/otUKdMZTKX
 RVoqEN3IAd/5j3cmZCgSIe/WMbER015hSErlKpE7J30Xzq16tyejqsSY8XfUW/AyaAjb8B/O766
 zXTDFwF5lMlw0vuq24rUnxAFJgiuu6eybXHhfbo+jHFY9WM0SHAvCdmFFtoiqvodYFdf/
X-Google-Smtp-Source: AGHT+IG1CF37ecOGVOctub1bFZDP/Lrqo1RpnPe9NCineMk4o2qxPlR8MCIkUyi/zaDMt6MRTlZZdA==
X-Received: by 2002:a05:600c:3ba3:b0:459:e200:67e0 with SMTP id
 5b1f17b1804b1-459f33bb3b2mr10838925e9.10.1754571734296; 
 Thu, 07 Aug 2025 06:02:14 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4440194.home.otenet.gr. [79.129.176.114])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5879d76sm101024775e9.24.2025.08.07.06.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 06:02:13 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 07 Aug 2025 16:02:05 +0300
Subject: [PATCH 2/2] MAINTAINERS: add Rust docs to qemu-rust entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-rust-docs-add-128bit-mention-v1-2-1d8a1ece3a51@linaro.org>
References: <20250807-rust-docs-add-128bit-mention-v1-0-1d8a1ece3a51@linaro.org>
In-Reply-To: <20250807-rust-docs-add-128bit-mention-v1-0-1d8a1ece3a51@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, pbonzini@redhat.com, zhao1.liu@intel.com, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=579;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=X5ZX/frCh80u0CQ6fP9JF3ZzC+6AFM2kDDf7/GfQP+8=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9sS1BTVWJBQnh2WlZyVTkySEU4blk4TlRnc2V0CmxENldDZUVsZWhqcnNGQm45
 aUtKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpTajBnQUt
 DUkIzS2Nkd2YzNEowRDR4RC85eXh5UVhzZ2RtcVZORGhhWm9wSUw0S2ZrYXNDUVlQaDVsYXhpWg
 ovYTJGVVBDUjBQRHFxK3ZuSkRtT0lBdHZaNUdaeWpFd2NBUkR2bmdHU21sOURhVDJBSTlNWUVsV
 3hISjNDaUE2Cmc1czBoanJLQkUwVnErVGJ0M0RsY3I4MVNIai85a1oxQnpWdzZBbFM0UW85UkFu
 V1B5QWdQZVNaVnBEeXduU3QKbElvNll2VVVtUTg2djVrMzF1MlBhZXUreS80QmZlNWR6aWxDdTV
 JMnMzNTBXaUtnbXRDbWtGWnNrYVJtOFlTNAo2eTg2N3E1a2lkK2wzQnUwRmppaFg4dTJnM3ZwbD
 JJS2kyMXladVpWcWhpYW96eFVpRHFRVGQ4WFRLN3ZsTzl2CkFhK2NPOUtLUFRMSTBVK1NUbjFVa
 CtkcFVmbk1nYXYybktzQVkyalpVRlF1N09TTDlqcEtqeklKcDlFZVVwRjAKMmVUK0hLVDZNbW8x
 SG0zQUUvUHI3cllGdXlLcUZWeDMvQkU2SEUxNk9Pa3VBMzM5L3dkREMvNCsxREQ3N3VTMwpJVTA
 1NmY0bHg3MTJPYUZuSUZlS0wrckZCWjFHZEZDb3BTV1VodE1iQXJtUUZUZGhLbW56dFdLdUNGa0
 ZMRmM4CjdSblA2Tkd1MURGcXZDYlNpb3gyWG9RRml1S1JEc05lZ3RhNzhBd2pMYWh0RWFsNjEwY
 lNvemxsUVA3UnFFQ3YKMXNVcU9ZMHd4UnYyRndXV29nY1c5T2tPR0k2ZGI2UVZTa0FscTBUWG15
 blBVSEVmUjFLZVNvT1AxSnVxK1gxQwpmRGNCVEMrOWg5QjluRWNqcFFRQUxGYXYzMmNXUm5NcFh
 jYmRiOURHSkZMdHc5b0pWeWMxSmRVZ1dFMVBoS2JYCnV1UlFaQT09Cj1PTzkyCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32d.google.com
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

Cc qemu-rust list when touching developer Rust docs

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a07086ed76213e3a204bbbf3a83137f1487e4b65..82011bb097fccac3dcc9df46cdb15afa41c44cbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3519,6 +3519,7 @@ Rust-related patches CC here
 L: qemu-rust@nongnu.org
 F: tests/docker/test-rust
 F: rust/
+F: docs/devel/rust.rst
 
 SLIRP
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>

-- 
2.47.2


