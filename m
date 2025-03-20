Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvG1S-0001Na-8F
	for mharc-qemu-rust@gnu.org; Thu, 20 Mar 2025 09:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG14-0001AV-3Q
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 09:32:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG10-0003Qb-0o
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 09:32:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso7922295e9.0
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742477571; x=1743082371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7YBryV/uJw5jCFJ3bAoM5/4/QhhkndLN0POBwK58ocE=;
 b=jWZmVwtPQEJk4OKnFcy6LkT7Kh6JjMwJKMBTZ6PF3a8kmVTJv4+iqhMAGZtK08r746
 Y0dwAHAYzo0ixDCXEPjtJs4TZN/VUGv7LfQlCly2lcXscqbbiQWWsb+ciXaMXTQZGNrn
 w/dKInnZhXVN89tzUhEam81uVKKqn/ghse+hfClHWvJhrtGsoW9QgE/xd9Gf4aC0cOEi
 LxOvaBGnCRgfDvTC81omwu9wV6Bbvqs64yCajbc/VqI24tsvk08XgE0nrAFmERKtDrHn
 c3lyDe1O1YWNQ1pfHp51QOeqfcH6QsMThdLHGylFch97Ye3G0XzR9fAFgiCP0dTL5tuJ
 08HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742477571; x=1743082371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7YBryV/uJw5jCFJ3bAoM5/4/QhhkndLN0POBwK58ocE=;
 b=XlpycGimEOKATQpT2m9HAkAoael8BJ8ejBQIt7rHjC9wMZHoGdRalbKNvz55pHO/mJ
 TEqambBT34kVS2cWBu2TJSc8ViAJFqaDDsv8UBG1x56kze5d5F6KwKDfhhkkmB2VP9b4
 h3HjMqBMKVvmzQ06mGaAbASs1BFPqbE71orpKyalQXHxAFl3OJEciTR9KGhf6duEyMQs
 MaHzxijgpPApoVJ+RGpO74B8VuMotceDIIepvolqof17x/Qvq8MsxIDO2xyCiW7cnUsK
 yFwOvCUfrNYgwJqs3xNKBPXebOArurJlUU9FBdQ87LBw62Nbipirm59QWICT10KkLrOM
 Mm6A==
X-Gm-Message-State: AOJu0Yz8Ghf+Yg8IK4kGITSiu47cejaImEuiYdeOiZKgwefmNsRVykV8
 ocZWCV2znawyPXGBeb4vSalvPTAbbja29LFMs6CCu5AOfD57SOOGIHg2uU3eQYg=
X-Gm-Gg: ASbGncsAjmAeJWtkj0xYySpUZSmcv48XCKYiZbJW+p/tDWirRTU8GP2msthTl2cBN5a
 S3K86fto5Hoe1xx7i8hzU8rcSjlN3x51tDp+7wD2fbO4dxpCs612djaRznw0M5G92XVvEOXJiv+
 JD4rouBClywz5Tt+Jnp/K4Suc0TCzR+KlEiik79xagfOK6tLk9hz2SNZTeBZFEJysWaX2EnbRqz
 J0O1dErkMCSFZsLUtF7MbOT8i4cIUQgk4iZDS5UjmlyrpM6afGTweSJY6lrQAR5uYxwK8a3Ck9n
 yrWDjMHVlVAN436b1IJkq7ONfl+WNFUfKGhMfcQOmSH6Tj0tRbI=
X-Google-Smtp-Source: AGHT+IGC2i/lrHcEYiHLepYpKi0ZctU+ZKix5VrmHDenXZcdxn25ITspzzM4ZTUoDrZD7ZrxkaRYeA==
X-Received: by 2002:a05:600c:1546:b0:43c:fb5b:84d8 with SMTP id
 5b1f17b1804b1-43d49549405mr28340205e9.16.1742477571247; 
 Thu, 20 Mar 2025 06:32:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm48804525e9.32.2025.03.20.06.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 06:32:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/3] rust: Fix PL011State size mismatch assert
Date: Thu, 20 Mar 2025 13:32:45 +0000
Message-ID: <20250320133248.1679485-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Thu, 20 Mar 2025 13:33:00 -0000

We have some users of the PL011 struct which embed it directly into
their own state structs. This means that the Rust version of the
device must have a state struct that is the same size or smaller
than the C struct.

In commit 9b642097d6b7 ("rust: pl011: switch to safe chardev operation")
the Rust PL011 state struct changed from having a bindings::CharBackend
to a chardev::CharBackend, which made it grow larger than the C
version. This results in an assertion at startup when QEMU was
built with Rust enabled:

 $ qemu-system-arm -M raspi2b -display none
 ERROR:../../qom/object.c:562:object_initialize_with_type: assertion
 failed: (size >= type->instance_size)

This series fixes that by the simple expedient of adding
a padding field to the end of the C struct to ensure that
it's big enough to also fit the Rust version of the device.

It also moves the failure from runtime to compiletime,
by adding a Rust compile-time assert that it hasn't made
the state bigger than the C one, so if we do this again
it should be caught before it gets into git. (We don't
need to do the same thing for the HPET device, because there
the HPETState is a private implementation detail of the C
code, not exposed to its users.)

NB: if the Rust version also needed stricter alignment than the
C struct that would also be bad; I don't attempt to assert on
that here, assuming that it's unlikely that we'll be trying for
anything more aligned than the usual pointer-alignment.

Patch 1 is Paolo's static_assert macro that he sent out earlier today.

Having the C struct visible to its users like this is not ideal
in the longer term; we have had discussions before about shifting
back to a "users only get an opaque pointer" design style,
for instance for the benefit of the "create custom machines on
the commandline" effort. I think this Rust/C issue is further
weight towards moving that way. But that would be quite a
lot of reworking of existing C code.

Exposing the C struct to users of the device also means that
they have direct access to all its fields, which obviously
will go badly wrong if they try to touch them when the Rust
version of the device is being used. Those fields are supposed
to be private, but this is based purely on the honour system,
and we do actually have a few places in the code that take
shortcuts and directly access a few fields (not for the PL011).
I had a proposal a decade ago:
https://lore.kernel.org/qemu-devel/1399650964-21067-1-git-send-email-peter.maydell@linaro.org/
for using macros and the compiler 'deprecated' attribute to
generate compiler warnings/errors for accesses to struct fields
outside the file implementing the device itself. 
We could perhaps resurrect that idea as a mechanism for
detecting places we would need to clean up before conversions
of future C devices to Rust.

thanks
-- PMM

Paolo Bonzini (1):
  rust: assertions: add static_assert

Peter Maydell (2):
  hw/char/pl011: Pad PL011State struct to same size as Rust impl
  rust: pl011: Check size of state struct at compile time

 include/hw/char/pl011.h          |  5 +++++
 rust/wrapper.h                   |  1 +
 rust/hw/char/pl011/src/device.rs | 10 +++++++++-
 rust/qemu-api/src/assertions.rs  | 22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.43.0


