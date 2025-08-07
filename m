Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447FCC87FCF
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 13:03:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk0GT-0002K8-CG; Thu, 07 Aug 2025 09:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uk0GB-00028F-Md
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:02:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uk0G8-0006tY-Oh
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:02:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-458c063baeaso6340565e9.1
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754571734; x=1755176534; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f//2yf583SEThhe/QDKnaLlWxecBSLAzEmutcOkTSD8=;
 b=mCQsTQZ7GSh92fGCxxfJuQJG+WiQ+erTqLf/5qoP5PNUH94XXFc/FkVW6eBnAwzz/0
 sEOcAYf4EgtUA0/gSx0e1dUqBwATlj2ewcl0I9WMgTsea/sCAKLYa5D2Hfcx/KBz98S6
 6PzumA3SlqKgE4M57CWYPPjuX3YCJIooo7SIHWMCN2XLiLt71oCBYv5N+uzisxyH/ZZx
 exERA8+IwXMFoN0jtJcS+HIjQh6VmzkvXuBuANmvhi8qDxQ3hFxSJikytcPTR6+6IsbJ
 f5Z2HWqQ6G5pD8gxzBzaK/LqZrJbV+k0nkOH5ozhG/fn/+owIUCRmqZXP8ZnK3F/vhTE
 0vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754571734; x=1755176534;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f//2yf583SEThhe/QDKnaLlWxecBSLAzEmutcOkTSD8=;
 b=L2csz6a0Cv4rav+rhLJomO5oPHNEWSr2Zgq+0rYrDbN66uD/33VjqQiGuuYKJwltk7
 w0vMfqSA3w95o1QUu0eq/H8qPu5/mbJoe7RZ07+gbEl2NvrS981NOpO6KlMn3uK0AiLF
 KYHIiIM1luBxavgBt5qbp27qV97qwQBGWt1h63MQl2wEJGEQa7aXrz2cOslpnp0snnP4
 U/MziAjUQqHHzBXNPqQOu/TZFC/Or0LVtJ7OEzLR7onqGLX12Ivl1EOM7PlsbN/cE4Tk
 keEmftegdoBPu0s0y1TgNarvo5O9Tk7y5Wvuohe6NsbYZ2yYKb0PL0AZoSBom0eV8MkZ
 bwgQ==
X-Gm-Message-State: AOJu0YyRO+7ZO4UNn7z4XE9/pjf4k37xn870+8mskjsSIGa3Y4se0sbU
 pceFjgZT9rriamCud3FeVonjdPIvCzPtUsExWQTAW7l/fURs6a9tE+QCl18Egb29uhlYlJpV4ve
 3fm1ldQ8=
X-Gm-Gg: ASbGncswZy663dS05nLf9RlsoV+eUubo7iPCy0yNt4NENSTDk8x4n3CoD2Hm4L8ZUvD
 u/9o7y9Qpa+tncwW7vdcjyyuGCixkmgO0G4D92COMEBedoZBuXFO4ZuL65IFEE5OSMCfP+1Ckdw
 EYqLQ5lYzyhYwP0gy0vMZu8XTPiHeYnhg2VglntjIuoo25XXzzMJfihrqSyC0S3d4YT3LFjwMk3
 WdVRn1GSml4gC8tMbXhTNItPXGGnVzyYDKKUXCjfR00z8Oll+p9VBXCwdPEWNtqDvfGgsIHb5I5
 HeYEtJ84UAE/cvkHbgrAYCRKJQSzm5VswBtFSU4YOIDvEx7zfAgq26OukNZmilK31l7vI/VuynZ
 D6jMPRnVz7mYPWDjVKg1/uKYC6Qs1eMZCGrwJYRHUNxF582u4HI4BGfALYJgZYbD3969X
X-Google-Smtp-Source: AGHT+IE5EzqzLgF/rXJ3VMGqW0FYoK9+DGS/z5EGwo2L/UyGBSZ0xjm+oQchDgbSpgBcIgFzqSuCrA==
X-Received: by 2002:a05:600c:1907:b0:456:2a9:f815 with SMTP id
 5b1f17b1804b1-459e7075ec1mr66695155e9.4.1754571733002; 
 Thu, 07 Aug 2025 06:02:13 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4440194.home.otenet.gr. [79.129.176.114])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5879d76sm101024775e9.24.2025.08.07.06.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 06:02:12 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 07 Aug 2025 16:02:04 +0300
Subject: [PATCH 1/2] docs/devel/rust: Add mention of 128bit integers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-rust-docs-add-128bit-mention-v1-1-1d8a1ece3a51@linaro.org>
References: <20250807-rust-docs-add-128bit-mention-v1-0-1d8a1ece3a51@linaro.org>
In-Reply-To: <20250807-rust-docs-add-128bit-mention-v1-0-1d8a1ece3a51@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, pbonzini@redhat.com, zhao1.liu@intel.com, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=s1N5r1fVGvE1POMGbkaaQ7oaC5GeKbgjxoWrG8Ko5q4=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9sS1BTMmNlcC9PbEtuSkJzdlI0ejlPV3l5K3RBCkV4SHVwbmlLU3dIYWxWYnZP
 QUdKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpTajBnQUt
 DUkIzS2Nkd2YzNEowRmlpRUFDWTM2d3VPZ3hmd3NLaGZYTmFocWR1NjZJU2VycS9tbGRYbFFTbQ
 pPTXFteUthcTYrSk5xTXR5SjFHU3lDQXdYUENUaTRRT1hpQ2ZxYXdKbURUZ2gxNnhiQnVLWW1Kb
 0xvTlVNRGJFCkdZa2dTV0tBR3RjTCtkR21XVnAvMm5XZGFHL0VWcUs1eVZsLzVNRlhnT3poNTVL
 OERpVEZMVm5QWmZmRnc2TjMKODRkYURaUHNubmtKQzZQRjVJczlpcXpHWjdLcXArQVUwN0JNalR
 yNlZaaW1UVC9qNFlNZHQyV1p4dVh5NjhWRgpCS0ovTVdLM3pTaXRLMUFFUHJpRUhNWllmMVEzaD
 FMdmRKMFFUWUhRU2dhS3czTkFXendVWlk4Q0VlOFV1NUNwClZxTzRXQzJTVkZRNklRR2FQN3J2R
 DZWYmx4UGZneTJ0NVZGV0VGUUp6d0VIdHJJUGVaWjBISXgrTFdBTnYwdmEKWEl2NEJsMmorRlI5
 b2FmM2tzTW44TDBRcWFqREZZYlY1V3pvZDVJbjhtVXZ3cVZpd0JVQm83ZWxXVG9jREJzYQpmYUt
 QRGtyUHFGcjcvVGxIT3RGY2lEZXY5bGVyRWc4MTR1QWl6NWRLY2M1SEtLNW1ndnJmSDJJTVNVMU
 xFOFcvCkZueStabEtZbWU0MGhlT0pvUDB2SENTOHdLRkZiaG5DbTlIdzRCVDRkQnNCdkJockxMc
 mRXYk5GYmJ0OU9PNEYKdEN4cW9oWHJCUys0blNSWHBZZ1ZtdkN4ZEdCK1lXOGtudmtaUmRhMGgv
 RFhNc3IxUVJNMDdpZnFTQWthMlN0OQpER2FVWDBoSk1MeCtwQis1WU10NGt4NW1wZkRhN3VPYm1
 pblY1R1J6K1RJekhXVHNyVjR0ZmIzc3k2NzU0NFdTCnhNb0RNdz09Cj1weElLCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x335.google.com
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

FFI and 128bit integers are now stable in 1.89.0, add a mention in the
"missing" list.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 docs/devel/rust.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index b6737536c694fd54fd0d3204c0dd1145a9b0e973..91b1eab78df0e0e25baef746d378717bc8dedcd4 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -105,6 +105,8 @@ are missing:
   ``callbacks::FnCall``, but is still experimental.  ``ASSERT_IS_SOME``
   replaces it.
 
+* FFI support for 128-bit integers (`stable in 1.89.0 <https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/#i128-and-u128-in-extern-c-functions>`_)
+
 __ https://github.com/rust-lang/rust/pull/125258
 
 QEMU also supports version 0.60.x of bindgen, which is missing option

-- 
2.47.2


