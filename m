Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8A2C87FCF
	for <qemu-rust@archiver.kernel.org>; Mon,  4 Aug 2025 15:22:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uix12-0001o3-1h; Mon, 04 Aug 2025 11:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXM-0005Y1-U7
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:37 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXL-0002Y1-5H
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-615398dc162so7814570a12.3
 for <qemu-rust@nongnu.org>; Mon, 04 Aug 2025 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754315253; x=1754920053; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dEWt1nkV51ylczEHQGWDauwKjNPPbnNW27Ct1uuvE4=;
 b=ZrDPGkR/YK7W9FzNhHfRQUJmvwAviMvm0b3aZVGtccaXYLdSszwExxm/sx+0T2PCVF
 K5TUI8YqRPr0jukTv/HDaUT3TMxWYdwWlcdzFSidtX7XikWRjeA6xB6fjw7TwEGKn7KH
 +/yIzNq0TN94PC0fEBP6qmtn6UzZggM+/c5Zk8+cFVXOvFFECPooceBV/li1dEE7VXjm
 F/060uUqIMDBBw3SynwzuoTXm0w80wS9Y5sV/mlOyMoRyptJDo2nfCP3RtP19Kh5Qr/I
 MF+oH65kc6RW7BuniJBlwyfe/opHWQLJS1gTb0yWAhDyAgOYq0epllAhORhYl7hy2rFr
 dr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754315253; x=1754920053;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dEWt1nkV51ylczEHQGWDauwKjNPPbnNW27Ct1uuvE4=;
 b=qvjYWKpypTqrbehXrm32sDfgA2QCOM97wXnmK/9AzBky28DBDDzLzKocm6zhLL9kNE
 LnRQtcBeBgaJzTBC56IdijEU8+qSV5SEal8b07WGJeAZnrj26B2q4PBa9x0+4cHEwam+
 m73ywVI2M83DAzm8tDQMsucD2wwwjohXVeuHdbJLi4h0eJvbRoI4uUwJiQsKihMqSEBE
 7qV4+pcRADUu3nBvrWuxOvzOw5gNnc5Qom96SabKWjqo0LLMyCFvgqbtOLyfv66TEy1g
 Un3iHyIC8WEzGNEZUL9OubQCyHR07Uh1i8oj8lHHM8bBDhzRrZFcxAJak6TdSDUyn4n1
 sA7w==
X-Gm-Message-State: AOJu0Ywb3SjtISk21OMqsoQ3hhOJfxfqqRSZcW9kB40g5LTwG1HmzAug
 ZNyh8zN3ib08OScQ9TtRdTtAGwagmAKhJXEia8RJY8/vdmqhbdEq7K79y7svdftdkzE=
X-Gm-Gg: ASbGncsse+V/01Lz7byILygv3UOiULx7bA/v5ENh+OrS0NYQwr41lE+aCOmEwr4Kokb
 l2lG/XOTaZc3ccY3ipMPaomqz1W8DUP1tCLndXvcXWe1g2tKivJ8rFG4NJ2IshTmufVmsvzbvJn
 CkB564dFoJLxREdnLVpPFUMDuQBD0mH25EnYu4Y7f3snuAKFln9XGJCypG0sOFLUglePhzeoOqG
 9Ga/MH5mzX0GSJJ3CTiGSt+wmJA0LVpW+4kB1yNag28QysGiqC3wGEths80u8znhZUZh2ctemWk
 Ie5loeLSC1khNTcdWPLNliyEGquydLDFJeQFC8a/6BVYPsRb+Za4QkTV+he5JPLBvV0Ysd/Jmvv
 KhhCg/aoPn+vLr1jydMEy3Pm5Fw3XAJWJS5LcSnOFlwr0VzgX030oG8YzGZJXYyqLm+8=
X-Google-Smtp-Source: AGHT+IHIAVRmRNYSEeQR9vCfOtwn6iiIu5jXVCX7qQiVYRmoFEBxrI2dNTqMje109n7u8YmXG/hxGw==
X-Received: by 2002:a05:6402:3cf:b0:5fb:c126:12c9 with SMTP id
 4fb4d7f45d1cf-615e715b8e6mr7094867a12.25.1754315253381; 
 Mon, 04 Aug 2025 06:47:33 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441708.home.otenet.gr. [79.129.182.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f15d9fsm6850590a12.17.2025.08.04.06.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 06:47:32 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH RFC 0/5] rust: implement tracing
Date: Mon, 04 Aug 2025 16:47:13 +0300
Message-Id: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOG5kGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMT3aLS4pL4kqLE5FRdC1NTi7RkS4vUZAsLJaCGgqLUtMwKsGHRSkF
 uzkqxtbUA+Qf84GEAAAA=
X-Change-ID: 20250804-rust_trace-8558fc98ec88
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 alex.bennee@linaro.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=0cn2oznmPWML060LhdxxMoV/MOETlWb05txkOhpa9bE=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9rTG56YXdIN2RnZnluUFdndXBYUWpJcThpQk5LCkFNeW5nZVNGeFFoTHRLbjN5
 VitKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpDNTh3QUt
 DUkIzS2Nkd2YzNEowTFB1RC85MnUwZ2g2RzVWRkpVSURFYWpUSG5CTFUxRUJTenNlWWg1cmZreQ
 plMHJ6aXpUNmgyUU03RXphcm9WWnl2YVBzVlB3d05maUxyaXJYbWtqY3J3azc1VWFZUWNmSHRtO
 GIxYTlTblZWClZ4RzRPTHpnZk4wTmptaXQ0Yk14clpjem1vY1JTUzFvZ1gwRVA4WkduK05BVS9I
 M3R5VHlpNU4wL2I0OHVMa3UKbkRuQlpuZWtra3A0L1ZWbFFpbmpZYW9hSmxsMWdlK2pETVU5ZWI
 0bk9FdWVjVThlRzhrQTFQczYyYVNSZ1FPRgp2UXZ3SWVwai91dGtrWG9qdk1kajJnTHlBb1lvc2
 t1Ymp6eG1lbnFUT3BNVVRNQ2hGLy9XYWxsbjk3TmtuQnl1CnlUVnk2cGVmcUp4d2tBd1gwYWRYb
 WZ3UWUxNVJpOU45cldFWGo3RFF1MUFoL1JvcHBhOGlwM3NKc0lqV1d1SHQKMG9KMDR2ZDJkZHlY
 ODlnWEdWYkplOG9LTTZURC82MFU0bTR1K3dXZTZSSXVRSUsxVk9nN1pBRm02YVpzelFlKwphSEN
 WbzBsZ0NWMnIwQi9yK2x3NUtxL0NWY2hXMVJjK2Q0UE1YWEEvR2VYd3BvcFRRYWhPdnZUTHlaZj
 hpN0tqCk9xUzNncDlJTzZrSmsyQlpKcjhRRmZBelprS25HQUl5dXErK1RYNGl4WXNISW1LbFhtb
 Tc3V3RQVnZCQ0JEeFUKT3RBVkNSZ1J5OTNZR3hRVVphbCs2ajBXOWUza2tyc3VlVENKTXExVUlL
 bXdLbk1UTlZNdDd5czZycVN5clBpdgpnU3FBdUZFY0h3M2dJakZyWXU4U2dsOS9uWGovS2crQVJ
 teXhOT3RqbWRYSmx5UDlnbjFwTlhjR3RqaW82eVFECnQyM2c0Zz09Cj1SQXJlCi0tLS0tRU5EIF
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

This RFC series contains some simple patches I've been sitting on for
some months to allow tracing in rust devices in a similar matter to C,
only it's done via a proc-macro codegen instead of using tracetool
script or equivalent.

It also adds the same tracepoints as C in the pl011 device (cc: Philippe)

TODOS:
- Do not allocate string when calling ::qemu_api::log::LogGuard::log_fmt
  (See commit message)
- Properly handle&report errors in proc-macro
- Clean up proc-macro code
- Add test for proc-macro
- Add dev documentation

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Manos Pitsidianakis (5):
      rust/bindings: add trace headers
      rust/qemu-api/log: add Log::Trace variant
      rust/qemu-api-macros: Add #[trace_events] macro
      rust/pl011: impl Copy, Clone for RegisterOffset
      rust/pl011: add trace events

 rust/hw/char/pl011/src/device.rs    |  28 +++++++-
 rust/hw/char/pl011/src/lib.rs       |  43 +++++++++++
 rust/hw/char/pl011/src/registers.rs |   2 +-
 rust/qemu-api-macros/src/lib.rs     | 140 +++++++++++++++++++++++++++++++++++-
 rust/qemu-api/src/bindings.rs       |   3 +
 rust/qemu-api/src/log.rs            |   4 ++
 rust/qemu-api/wrapper.h             |   2 +
 7 files changed, 215 insertions(+), 7 deletions(-)
---
base-commit: e5859141b9b6aec9e0a14dacedc9f02fe2f15844
change-id: 20250804-rust_trace-8558fc98ec88

--
γαῖα πυρί μιχθήτω


