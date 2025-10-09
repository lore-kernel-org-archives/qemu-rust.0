Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5030ACCD183
	for <qemu-rust@archiver.kernel.org>; Thu,  9 Oct 2025 21:12:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v6xvd-0004uG-QY; Thu, 09 Oct 2025 17:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v6xvc-0004tq-E9
 for qemu-rust@nongnu.org; Thu, 09 Oct 2025 17:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v6xva-0004fZ-LX
 for qemu-rust@nongnu.org; Thu, 09 Oct 2025 17:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760044312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9x2xBqXLvD3TD22ZGiq+KsjrIorcQc7dSOkJFfUH7FU=;
 b=Lxsfxjs9cGlfyhSZcLFOIZWgUoSH66HonWEG89VJ4Rr6ciwitgE9KZMuRn56fr32ox8UV0
 aSmkDPVxGBXWk3TOmcgGkh3SkttGiuSpbeoRDUU/5Lmdgiq9jcM2eglwORTbXd7NKsMxTY
 c8fh9PkEAiTRM65x9dmAs5FPq0XO9YY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-lIn3OCIUOq6vAhIk929Yew-1; Thu, 09 Oct 2025 17:11:51 -0400
X-MC-Unique: lIn3OCIUOq6vAhIk929Yew-1
X-Mimecast-MFC-AGG-ID: lIn3OCIUOq6vAhIk929Yew_1760044310
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e4d34ff05so7761235e9.2
 for <qemu-rust@nongnu.org>; Thu, 09 Oct 2025 14:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760044310; x=1760649110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9x2xBqXLvD3TD22ZGiq+KsjrIorcQc7dSOkJFfUH7FU=;
 b=atFenx5ETJ0zErQsoBMDnvF6LKLAEAVtJulMBKBTsiIXwLTHb3PUJQqPSvptk5x1w3
 Nno93EId8ND9idrG7PF479RSPQofRncdX4t1jJBNrxmvMPCcUvNiJKRSFzafVmk2Cmfn
 uSsfAlVYsA37qjVhbYWKHEeKVHYMw5yRBanH5LIQPBvtOtDZr+r+jx7wDWjZmtAuYpyw
 3jIER5adbsfYk89LUbUObgNu2f7R18itVvHmDD/c9QXf3ga8esDgw2EZekxMcNt0nY5N
 UMIJqRwlG2yZo9GqhlphW47s32CusZpERyuyEVAvV8BB3gfBOdfgHJ4M/nkJdaiRGgT0
 nRvw==
X-Gm-Message-State: AOJu0Yxh2mf3Rux/1eY0kETTppXnNrepdgEvDf0AxgwMVus2jiSHn9OO
 t78uAcZPcGk2lOIUAy2P/p2LUChGD/dyg97MycCkNd5mnsT617TUOaSolaeGhxjJNPu7xM8FnCd
 ATR0XCkQk6IiQo59kHcLbpzGTB23zRlGKwaL6YWqCxGRE9MLpNCWk7K0=
X-Gm-Gg: ASbGnct8py92H/bxK58Jn9bCqRmAHVDagpTOsOMpge0JThcCh/3uR1Yx1H/rDTuVabJ
 O6IHK3bgrf4ZLF/rHhJCyFiCDIWw8TLbDo9F+6N/c/RtkTt+UewkoGyA5tmwOaiOPlLMlMV7JUx
 9pPWxL661weL+V04LefnPfib4tL9Oct2CI25K1jSp88ZbMOBYRZO9PynlyqtlkNqd48COWX6U4S
 TGf1zGZmsRvIsLsyas8UEZwYkLoD/trN8CJt99+Z73Z62h9bwyUpZ3V3u0r2z6euMxvwmTlh5jR
 aCOhBDjHCUAJ8H/fMYFVORPd+tfY1zxqVTyhrXZxuVujRONgJMLpJd48jrUOiugd/Xr8KugmwWt
 UhtqKIZPxq2EZfiQwUPmpHcIUm8BWTp/RZYC3ExQTpBsFCktgZA==
X-Received: by 2002:a05:600c:3b08:b0:46e:53cb:9e7f with SMTP id
 5b1f17b1804b1-46fa9af830fmr64751255e9.18.1760044310280; 
 Thu, 09 Oct 2025 14:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFwjdn4cazfc4hMvWgMhira4B/vpSl5YwgMX+hrU8h6QnaFKvmSFUEwqCrSbECMZT6p+QBoQ==
X-Received: by 2002:a05:600c:3b08:b0:46e:53cb:9e7f with SMTP id
 5b1f17b1804b1-46fa9af830fmr64751205e9.18.1760044309924; 
 Thu, 09 Oct 2025 14:11:49 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49bd9e1sm11523455e9.12.2025.10.09.14.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 14:11:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] rust: pl011: fix warning with new clippy
Date: Thu,  9 Oct 2025 23:11:48 +0200
Message-ID: <20251009211148.642966-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yg624zwu5sE_Op44NSi7xgaBjp_Rpc2JZ6CPZtc0pAI_1760044310
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Newer versions of clippy are able to see that all the variants in
the PL011 word length enum end with "Bits", and complain about it.
Allow it.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/registers.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/hw/char/pl011/src/registers.rs b/rust/hw/char/pl011/src/registers.rs
index 0c3a4d7d214..fa572811b29 100644
--- a/rust/hw/char/pl011/src/registers.rs
+++ b/rust/hw/char/pl011/src/registers.rs
@@ -255,6 +255,7 @@ pub enum Mode {
 
 #[bitsize(2)]
 #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+#[allow(clippy::enum_variant_names)]
 /// `WLEN` Word length, field of [Line Control register](LineControl).
 ///
 /// These bits indicate the number of data bits transmitted or received in a
-- 
2.51.0


