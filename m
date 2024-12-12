Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtW-0006pn-4s
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtS-0006nM-CT
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtG-0006mL-Vz
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qns/X8H2PNJ05wsGWyjsR/L+wlODTrfFTvyB/zyipf8=;
 b=jFy+aStXsellOR5xLSQBoVpCBWqJvgvi/asJt+2s93Bj+Uc+W71qi2laplF11ZkONKRdC9
 cB4z7cNxtzs639HbIteA4IVckThq8oOn16Au0FZRfuEg7rra50aJlOc8MVZgaTUvolrrEB
 2kibypbdBPDvftNfwT3V0Ep71H9GyMw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-xNknSb0rMty1ljjyStnHKQ-1; Thu, 12 Dec 2024 12:22:15 -0500
X-MC-Unique: xNknSb0rMty1ljjyStnHKQ-1
X-Mimecast-MFC-AGG-ID: xNknSb0rMty1ljjyStnHKQ
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43624b081f3so7979545e9.1
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024134; x=1734628934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qns/X8H2PNJ05wsGWyjsR/L+wlODTrfFTvyB/zyipf8=;
 b=N3E141k+ZymYdwSaHRfZ9CiYoq8eFZ2FBvs4Kj20sk9BjgrvHfKbJZ4E/r1Fx8VRM+
 tME6UipazRw8eNFVO46YqRNtXRYXg1qYx++nvmPhfxgoUNc2r22rJvq5mixW1z/K6Dv/
 epSbbnjO9fsUmzqq0bCyEPqyFpRK+HFMhUxdNieCKW+V1G52azWkhK3YTVCJBmbq9/gT
 eRhpV/0qPfx/ujoHzQmrpFpM7zyeBkga/aY72Hif1xo2LbpwdbYdT17XfFdFOHSrvsKD
 hr96Rbh7xP7tjY8u0AP6gDxp76KJflg3lrLFa6EHKgVcaYGGe0JYQ+5y1SAZgQUMWubZ
 kb2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhiyyJ4C7LyK7FleJXdbkZdCB0HyuRe8a3Gbx5cA1D11F69dnX9X+3mzMfE3nX25LqLYldvd1l6ws=@nongnu.org
X-Gm-Message-State: AOJu0Yw4nJ2iXkI781jHaeSWSiPxzTRyalIyzDZh9Ir4Chk57+0e6/ap
 lbbqmHgDjMq06aMO4GCFtBZdbhy6H4o0MRdxD76pZdJf+xGdYyxr1rpEyP0JPqPVefPqSnQEKLi
 8nYseam0ct69nMwPHlOMRFrsRbC7moEfDMM2bkdNYVNz0m9HcwP0=
X-Gm-Gg: ASbGnctwhisy7JnXSaDUY7BBjJk9TkfV4LSeYSoz3C8ZLL3UcY4+5gk1ve1bdyHT5zg
 vA+dqIQTwgvUDjfmFAIUVTC0av/z6kpDqZLJyAHbl8iWfA3OvL8+9oqC5hbOqdmK4CQFZBm3wHJ
 HMJwq53WkFFqdGYhbHlD+aIot9+49qdneScK4YipNKfgobc4IAKKhTBMGM0SDErAOi4/QEuVeI7
 yZ0xTP0EQb7du5iuPeQAvBXdgmXCviKLFF4TSxkrZx9y21bwkP/T2bBfAre
X-Received: by 2002:a05:600c:3593:b0:435:294:f1c8 with SMTP id
 5b1f17b1804b1-43622883637mr31159135e9.28.1734024133847; 
 Thu, 12 Dec 2024 09:22:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbopeWngomw2GJnLUPpY65052E82dIWyU/Xh4pmo+qt4fFEVBFBxQb/yuBEwHKpSSHpc/W6A==
X-Received: by 2002:a05:600c:3593:b0:435:294:f1c8 with SMTP id
 5b1f17b1804b1-43622883637mr31158895e9.28.1734024133412; 
 Thu, 12 Dec 2024 09:22:13 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362555334bsm22739135e9.1.2024.12.12.09.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 1/7] rust: pl011: fix declaration of LineControl bits
Date: Thu, 12 Dec 2024 18:21:58 +0100
Message-ID: <20241212172209.533779-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212172209.533779-1-pbonzini@redhat.com>
References: <20241212172209.533779-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gGXb1p0XiJf4MvWlh3-VyEARd7so8M_dt86DZyWR66E_1734024134
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 12 Dec 2024 17:22:30 -0000

The bits in the LineControl struct were backwards. :(

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/lib.rs | 82 +++++++++++++++++------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index 4dc0e8f345f..d5089f78854 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -319,32 +319,21 @@ fn default() -> Self {
     /// Line Control Register, `UARTLCR_H`
     #[doc(alias = "UARTLCR_H")]
     pub struct LineControl {
-        /// 15:8 - Reserved, do not modify, read as zero.
-        _reserved_zero_no_modify: u8,
-        /// 7 SPS Stick parity select.
-        /// 0 = stick parity is disabled
-        /// 1 = either:
-        /// • if the EPS bit is 0 then the parity bit is transmitted and checked
-        /// as a 1 • if the EPS bit is 1 then the parity bit is
-        /// transmitted and checked as a 0. This bit has no effect when
-        /// the PEN bit disables parity checking and generation. See Table 3-11
-        /// on page 3-14 for the parity truth table.
-        pub sticky_parity: bool,
-        /// WLEN Word length. These bits indicate the number of data bits
-        /// transmitted or received in a frame as follows: b11 = 8 bits
-        /// b10 = 7 bits
-        /// b01 = 6 bits
-        /// b00 = 5 bits.
-        pub word_length: WordLength,
-        /// FEN Enable FIFOs:
-        /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
-        /// 1-byte-deep holding registers 1 = transmit and receive FIFO
-        /// buffers are enabled (FIFO mode).
-        pub fifos_enabled: Mode,
-        /// 3 STP2 Two stop bits select. If this bit is set to 1, two stop bits
-        /// are transmitted at the end of the frame. The receive
-        /// logic does not check for two stop bits being received.
-        pub two_stops_bits: bool,
+        /// BRK Send break.
+        ///
+        /// If this bit is set to `1`, a low-level is continually output on the
+        /// `UARTTXD` output, after completing transmission of the
+        /// current character. For the proper execution of the break command,
+        /// the software must set this bit for at least two complete
+        /// frames. For normal use, this bit must be cleared to `0`.
+        pub send_break: bool,
+        /// 1 PEN Parity enable:
+        ///
+        /// - 0 = parity is disabled and no parity bit added to the data frame
+        /// - 1 = parity checking and generation is enabled.
+        ///
+        /// See Table 3-11 on page 3-14 for the parity truth table.
+        pub parity_enabled: bool,
         /// EPS Even parity select. Controls the type of parity the UART uses
         /// during transmission and reception:
         /// - 0 = odd parity. The UART generates or checks for an odd number of
@@ -355,21 +344,32 @@ pub struct LineControl {
         /// and generation. See Table 3-11 on page 3-14 for the parity
         /// truth table.
         pub parity: Parity,
-        /// 1 PEN Parity enable:
-        ///
-        /// - 0 = parity is disabled and no parity bit added to the data frame
-        /// - 1 = parity checking and generation is enabled.
-        ///
-        /// See Table 3-11 on page 3-14 for the parity truth table.
-        pub parity_enabled: bool,
-        /// BRK Send break.
-        ///
-        /// If this bit is set to `1`, a low-level is continually output on the
-        /// `UARTTXD` output, after completing transmission of the
-        /// current character. For the proper execution of the break command,
-        /// the software must set this bit for at least two complete
-        /// frames. For normal use, this bit must be cleared to `0`.
-        pub send_break: bool,
+        /// 3 STP2 Two stop bits select. If this bit is set to 1, two stop bits
+        /// are transmitted at the end of the frame. The receive
+        /// logic does not check for two stop bits being received.
+        pub two_stops_bits: bool,
+        /// FEN Enable FIFOs:
+        /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
+        /// 1-byte-deep holding registers 1 = transmit and receive FIFO
+        /// buffers are enabled (FIFO mode).
+        pub fifos_enabled: Mode,
+        /// WLEN Word length. These bits indicate the number of data bits
+        /// transmitted or received in a frame as follows: b11 = 8 bits
+        /// b10 = 7 bits
+        /// b01 = 6 bits
+        /// b00 = 5 bits.
+        pub word_length: WordLength,
+        /// 7 SPS Stick parity select.
+        /// 0 = stick parity is disabled
+        /// 1 = either:
+        /// • if the EPS bit is 0 then the parity bit is transmitted and checked
+        /// as a 1 • if the EPS bit is 1 then the parity bit is
+        /// transmitted and checked as a 0. This bit has no effect when
+        /// the PEN bit disables parity checking and generation. See Table 3-11
+        /// on page 3-14 for the parity truth table.
+        pub sticky_parity: bool,
+        /// 15:8 - Reserved, do not modify, read as zero.
+        _reserved_zero_no_modify: u8,
     }
 
     impl LineControl {
-- 
2.47.1


