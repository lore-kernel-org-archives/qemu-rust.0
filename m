Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuz8N-0004V9-93
	for mharc-qemu-rust@gnu.org; Wed, 19 Mar 2025 15:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuz8L-0004UL-Iq
 for qemu-rust@nongnu.org; Wed, 19 Mar 2025 15:31:21 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuz8F-0005OW-Oz
 for qemu-rust@nongnu.org; Wed, 19 Mar 2025 15:31:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2897257f8f.3
 for <qemu-rust@nongnu.org>; Wed, 19 Mar 2025 12:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742412674; x=1743017474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S/wfhBIu9lXn5l5lkjHux+TggfIePCVAh+mYui/7+3Q=;
 b=vCUH6sJwGzqP51+X/rHyBnAGi01mKAm2Ja5u9dmiGIWJU1FwvgPGBHIEUkiw52r1OT
 BfOnhV2VZUUVc+5rui/p5XCyNZ5WyisF8rjROHARJJmvfN9TvDgZB407VMqNdm/gNwTZ
 SEltCZMPPXfsmMQCinUDZOd3DkO8dr3EAmLz616zyNdKKXVCTwhFVqO2nnN5ddbtPq0X
 6wnzR+l4HqMcH+QsuHlghsNZKblPxGJsg8z8Bqh6/x7EIiJFdiVlgwBvLOCkspOEUsIU
 9LWdM5TnFUtu8EbvXF73sH3Z+NyvmrsM8yNPCRkrXzylgYMpC02s2lsYiW9gidY7DtcU
 Xamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742412674; x=1743017474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S/wfhBIu9lXn5l5lkjHux+TggfIePCVAh+mYui/7+3Q=;
 b=f77jcpgxGNvKjxXlm/Uw8S0QBDhZNFloEo8DJRsmo5sUMlmI5NG4RtAcQp8AmPgM7l
 pFjTSiI1MpyuNccmYe5+aUw7+ZLfxjbpgGU43ufa80YJhj/jXKSlpIlmI7mb45/m+KOD
 budi6gLLAcMXUg9K4u2fSKLHPZQ6kgwQRt1Qw712XWb0pg7C+gmiiI4ammHRetH78j4C
 jQLy/GHCO8Fby7RwKdiNWrqZ5XLYD4V9WUtXVaXwL+YkvoQ3ecJaAIg01mwwq+mZrvi+
 sVYfZ+2QTHgDRDEq6I586RTG8uobseRKU/XzVRRV4f7wb5SDRMAR93/79TMOGMnUtn0L
 idlw==
X-Gm-Message-State: AOJu0Yx0WiUWx66xjCsqurVw+zexdlkkY2GuZAjcl1sNXcjSxCin2l1V
 LrcSNv39Hjf33RtiAl7v7ncbKFRUqA45F2TvKcfbyA0kayzRHI2hN+ys9e0S6F8=
X-Gm-Gg: ASbGncuQdcW0LFWQ9Oli+43U1SLfemMctyPCDHpAlrrfTaSYnb/rD38pBtiWhxAzz3d
 HIR+vF1nTLF1rXJMzFmtRJOKnDf3G/SmL4SRKdVCdQziEkJNHwTtV4d6HdEDrrWLehcCpnDjeq/
 2tIPRVuivDLQr0lA9oQIBvRZm4Oz2njmXRw6In0SBCLZzaKrlUdoaI4eWZInyGF6O7vJ2c4rGR+
 ikE2lorniXiVQZBCxaNpEcUos2XAhMlszRFvIJugEVocPN3a58iyLpFOYmypyWuQw1Phk2Z0J00
 PSzuaennNMXpng72bHwILODmGjfLY5ilm2s3foUa7JbXXUIbHmc=
X-Google-Smtp-Source: AGHT+IG25yxS/Ktv+VOl9w0rYr45RYr9A4ZX2d6JO+jSFn0sEy3dVs5EyaRoWqjKC/rb30R2vkYBVA==
X-Received: by 2002:a5d:47a8:0:b0:391:43ff:8ca8 with SMTP id
 ffacd0b85a97d-399739c8e78mr3356984f8f.26.1742412673716; 
 Wed, 19 Mar 2025 12:31:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f47196sm26790495e9.16.2025.03.19.12.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 12:31:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Tanish Desai <tanishdesai37@gmail.com>
Subject: [PATCH 0/2] rust: Kconfig: factor out Rust vs C impl choice
Date: Wed, 19 Mar 2025 19:31:08 +0000
Message-ID: <20250319193110.1565578-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Wed, 19 Mar 2025 19:31:21 -0000

This patchset fixes a compilation failure if CONFIG_VMAPPLE is
enabled in a Rust build, which happens because hw/vmapple/Kconfig
didn't have the "pick the Rust PL011 if Rust is enabled" logic in it.
Rather than just adding that to yet another PL011-using board
model, this patchset refactors how we handle devices which have
both a Rust and C implementation in Kconfig:
 * CONFIG_PL011 is "do we have/want a PL011 of some kind"
 * CONFIG_PL011_C is the C impl
 * CONFIG_X_PL011_RUST is the rust impl
 * selecting CONFIG_PL011 pulls in one impl or the other
   depending on whether the build has Rust enabled or not

For the PL011, this lets us drop a lot of duplicate logic
in Kconfig files for boards; for HPET this simplifies
places in code that have ifdefs for "do we have an HPET?".

NB: I think this should be OK but haven't been able to do
complete testing because currently in head-of-git
"make check-functional" doesn't pass for arm with Rust
enabled due to a different issue.

thanks
-- PMM

Peter Maydell (2):
  rust: Kconfig: Factor out whether PL011 is Rust or C
  rust: Kconfig: Factor out whether HPET is Rust or C

 configs/devices/i386-softmmu/default.mak |  1 -
 hw/i386/fw_cfg.c                         |  2 +-
 hw/i386/pc.c                             |  2 +-
 hw/arm/Kconfig                           | 30 ++++++++----------------
 hw/char/Kconfig                          |  6 +++++
 hw/char/meson.build                      |  2 +-
 hw/timer/Kconfig                         |  8 ++++++-
 hw/timer/meson.build                     |  2 +-
 rust/hw/timer/Kconfig                    |  1 -
 tests/qtest/meson.build                  |  3 +--
 10 files changed, 28 insertions(+), 29 deletions(-)

-- 
2.43.0


