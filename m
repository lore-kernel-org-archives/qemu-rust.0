Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHefI-0004mm-1z
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 04:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefE-0004lr-Mb
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefA-00009q-V6
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747815531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oBjkbO7ab/Bs8vweaRnYdvEsyUdC25nLwFE9KdD0if0=;
 b=HIvOEQcPMv2e+XggUGygBEwwHOZWZJJ4TFR+XXY4+WqWDI8pWv6Y8po1kftxY75iq6pba/
 FlDXWchElmkMhXzEnLn1PffawqGtWmC/spfPZQCNaGKemiagvv3cZYs0ow9XikmlJrPRo3
 0JKn/Mx2/aNsGaJnf7DSM9kTo2ooMPs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-wtWUjZgtOdKr88MIKBfhzw-1; Wed, 21 May 2025 04:18:50 -0400
X-MC-Unique: wtWUjZgtOdKr88MIKBfhzw-1
X-Mimecast-MFC-AGG-ID: wtWUjZgtOdKr88MIKBfhzw_1747815529
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a370309e5cso2126321f8f.3
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 01:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747815528; x=1748420328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oBjkbO7ab/Bs8vweaRnYdvEsyUdC25nLwFE9KdD0if0=;
 b=iqLU6pmB3U0ypoQYsKR23vWu2IRaC1JZ+KrjcsYTXzNiEtKUzWg07vla5oPyHvPsaY
 0ZEHoFRQCSgMxZw2ebX28oNWvLCr22SQNMY9FxcRr3sj7V8IbexI0HMqerbuXZ+0UkgI
 K1ArrUK1GYKxLU5LpNjgE1oKAugHy5OkVTP7fIwhNOtjy6D4XKI+s6y59f/X+geMI31R
 Bv2hoLo3lpQIiEzWnmRLmmzLawYBkoCcqerQwZttrjesMsxhTwej2Svi6Yui1C7QkiJT
 gdVzj1GRb1d1zPKCew0VMZhwZKaOmGIipEBVrr9CwrEvgapfmbvK4exnxYB0EhxYvmzP
 ldfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDtfopg0hP0axnAWv6bAm5zXCw6dJXAg2obB4Ik/pGteTG+l+tlFestFrAvBOcx0U2E51sIFWx06I=@nongnu.org
X-Gm-Message-State: AOJu0Yyqd17wpDr9CQWyJZTbeXWaoZw5MUne6XXiGTxUUuTYgoSFhD7s
 AcuUDzhXEzx9j32q7V06t6SudZjqndqxNLrbKMHF7pZ5Ugm5L/cmgoGTNO4lp8aftke00o9pAgW
 FZ3xp59PtJNbt+5TrsR89a3KSKcwTqyrJgspaH3lZZog9bJl4mKLsIJMuyvqzQQ8=
X-Gm-Gg: ASbGnct4/RCLPrfpWUyBBJB5mrkduUloC1pswJJKsMMvVqWRj7nnKJZlpgOlJ3aNnPK
 9A33HvFnA6K8MakfZxnAD88+lzdz3AlDb5Rvp+ap/bUwk4nOlglog6Xcd6/PuAiHo/cn3rzOjhI
 fWqh6Lvaxj9xUxclwlERWVvjnoV5mbTJfp3C6ZYwpjh7VKDvfOJ6mX7TArLJMdzjU1aN7Uc95Cw
 kHRClfnksQ32IHY+m59mKayl1ZWodo95G/oKJ8ijRLn/e0h/ExTWq5Q2fuclXW0mIyfeUwFWw8z
 egl3Tx6AqxYX7g==
X-Received: by 2002:a05:6000:e4e:b0:3a3:6273:802f with SMTP id
 ffacd0b85a97d-3a36273835emr15122789f8f.14.1747815527957; 
 Wed, 21 May 2025 01:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsg/GqmklxmQ7sz4QFR1LXhEFG9K6O4Ar6IkiF6h+ieSZuCuV56zTQtlu5fzkXbeXsXhXonA==
X-Received: by 2002:a05:6000:e4e:b0:3a3:6273:802f with SMTP id
 ffacd0b85a97d-3a36273835emr15122764f8f.14.1747815527546; 
 Wed, 21 May 2025 01:18:47 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f78b2f19sm58652665e9.32.2025.05.21.01.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 01:18:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-rust@nongnu.org,
 manos.pitsidianakis@linaro.org
Subject: [RFC PATCH 0/6] rust: make usage of bitmasks and bitfields nicer
Date: Wed, 21 May 2025 10:18:39 +0200
Message-ID: <20250521081845.496442-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QihfNFukSRa422ygODC1T7kkuHi0bdzH91Ta5JzJWdI_1747815529
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 21 May 2025 08:19:01 -0000

This adds or modifies some of the early choices that were done when
writing the pl011 crate.  Now that the implementation is safe and
readable, it's possible to look at the code as a whole, see what
looks ugly and fix it.

To see the effect on the pl011 code, jump at patches 2 and 4.  But
overall the focus is on "ugly" constant declarations of two kinds.

First, bitmasks.  These are currently written like this:

    const IRQMASK: [u32; 6] = [                
      Interrupt::E.0 | Interrupt::MS.0 | Interrupt::RT.0 | Interrupt::TX.0 | Interrupt::RX.0,
      ...
    }

Here the issue is threefold: 1) the repeated "Interrupt::"; 2) the
ugly ".0" and 3) the type of IRQMASK is not "Interrupt" to avoid further
".0"s elsewhere.

All this can be fixed by abstracting this kind of bitmasks, and the go-to
solution for Rust is called "bitflags".  However, it does not solve the
constant declaration part so I'm rolling my own here, while keeping it
similar to bitflags so it's not completely foreign to Rust developers.
It's a bit simpler and it has the extra expression parsing functionality,
so that the above becomes:

    const IRQMASK: [Interrupt; 6] = [                
      bits!(Interrupt: E | MS | RT | TX | RX)
      ...
    }

(this specific case can also be written simply as "Interrupt::all()",
because all bits are set, but still).


Second, while the "bilge" crate is very nice it was written with the
expectation that const traits would be stable Real Soon.  They didn't
and we're left with stuff like

    pub const BREAK: Self = Self { value: 1 << 10 };

So this series replaces "bilge" with an alternative implementation of
bitfields called (less cryptically) "bitfield-struct".  Now, there is a
trade-off here.  It is described more in detail in patch 4, but roughly
speaking:

++ bitfield-struct supports "const" well

+ bitfield-struct is much smaller than bilge, so that it is possible
  to remove a bunch of subprojects

- bitfield-struct requires manual size annotations for anything that is
  not a primitive type (bool, iNN or uNN); this is especially annoying
  for enums

It's important that the disadvantages affect only the definition of
the type.  Code that *uses* the type is the same or better, for example
the above const declaration becomes:

    pub const BREAK: Self = Self::new().with_errors(Errors::BREAK);

This "with_*()" convention is in fact the same that it's used for
VMState declarations, such as in ".with_version_id(N)", so there is some
consistency too.

Again, I do like "bilge" and I think it's usage of arbitrary-width
types like "u4" is very nice and readable.  If it ever grows "const"
capabilities it's certainly possible to come back to it, but right
now I feel that the trade-off leans towards the switch.

Paolo


Paolo Bonzini (6):
  rust: add "bits", a custom bitflags implementation
  rust: pl011: use the bits macro
  rust: qemu-api-macros: add from_bits and into_bits to
    #[derive(TryInto)]
  rust: subprojects: add bitfield-struct
  rust: pl011: switch from bilge to bitfield-struct
  rust: remove bilge crate

 rust/Cargo.lock                               |  75 +--
 rust/Cargo.toml                               |   2 +
 rust/bits/Cargo.toml                          |  19 +
 rust/bits/meson.build                         |  12 +
 rust/bits/src/lib.rs                          | 441 ++++++++++++++++++
 rust/hw/char/pl011/Cargo.toml                 |   4 +-
 rust/hw/char/pl011/meson.build                |  12 +-
 rust/hw/char/pl011/src/device.rs              |  51 +-
 rust/hw/char/pl011/src/registers.rs           | 145 +++---
 rust/meson.build                              |   4 +
 rust/qemu-api-macros/src/bits.rs              | 227 +++++++++
 rust/qemu-api-macros/src/lib.rs               |  60 ++-
 rust/qemu-api/src/vmstate.rs                  |  34 +-
 subprojects/.gitignore                        |   8 +-
 subprojects/arbitrary-int-1-rs.wrap           |  10 -
 subprojects/bilge-0.2-rs.wrap                 |  10 -
 subprojects/bilge-impl-0.2-rs.wrap            |  10 -
 subprojects/bitfield-struct-0.9-rs.wrap       |   7 +
 subprojects/either-1-rs.wrap                  |  10 -
 subprojects/itertools-0.11-rs.wrap            |  10 -
 .../bitfield-struct-0.9-rs/meson.build        |  36 ++
 subprojects/proc-macro-error-1-rs.wrap        |  10 -
 subprojects/proc-macro-error-attr-1-rs.wrap   |  10 -
 23 files changed, 917 insertions(+), 290 deletions(-)
 create mode 100644 rust/bits/Cargo.toml
 create mode 100644 rust/bits/meson.build
 create mode 100644 rust/bits/src/lib.rs
 create mode 100644 rust/qemu-api-macros/src/bits.rs
 delete mode 100644 subprojects/arbitrary-int-1-rs.wrap
 delete mode 100644 subprojects/bilge-0.2-rs.wrap
 delete mode 100644 subprojects/bilge-impl-0.2-rs.wrap
 create mode 100644 subprojects/bitfield-struct-0.9-rs.wrap
 delete mode 100644 subprojects/either-1-rs.wrap
 delete mode 100644 subprojects/itertools-0.11-rs.wrap
 create mode 100644 subprojects/packagefiles/bitfield-struct-0.9-rs/meson.build
 delete mode 100644 subprojects/proc-macro-error-1-rs.wrap
 delete mode 100644 subprojects/proc-macro-error-attr-1-rs.wrap

-- 
2.49.0


