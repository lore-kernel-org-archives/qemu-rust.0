Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqGA-0003sc-3Y
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAo7f-0004TK-CJ
 for qemu-rust@nongnu.org; Fri, 02 May 2025 07:00:03 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAo7b-0008Pw-Pr
 for qemu-rust@nongnu.org; Fri, 02 May 2025 07:00:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so1393283f8f.3
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746183598; x=1746788398; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=boH7AIppjrghdlxAs034b0zl0rG1O29gtQppRK5A2vY=;
 b=uIVfp2xYLtdEGD9uQO8Vm7ZERPGhS3M+zTTFlvFVEAod+mJjJmlqL+POEbeeG21wUL
 EbM2vz1FA+6Q446S1F2gBmg6Fjp/0EFFzjU76iC2RvEZn9EJZi5kfYgM5Q4XXrFgwp7k
 bMlL0asiLLkkn7RxsQ2fBdGhI2bncuc7C+Te8h5J1fuGbrf7leKKPPMVY4I/YmnEgLyE
 PPSNF/dYCAZoyE4NRmDJiI0Guw5PlV7V6RQ/f8rn39H7OO7LytvIf+MkUZIXSJ3dXqHK
 Orki0vsvsttnQH+oHrRK9AO4T5k/Ad6yWY1j4uLBbfRn/qVkGRUkfXXlFIXFAQ5UNGU4
 3+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746183598; x=1746788398;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=boH7AIppjrghdlxAs034b0zl0rG1O29gtQppRK5A2vY=;
 b=vGR1waq07Ule0MWhd+Vybp9Ubbkg6fqLvEB1SafNWt8/D33lTlPwzH9SOMavJ1+VIt
 jIX1o5GSNr8+lzPqUZZc2CWEzyUTe3TzGlH1KHpteAG/VIP5UXcpuTS7IzO8yEJ/lNAM
 B+hmfwi1YrBMVotYb23/oyWC93VQ+Th938g0+CXyxsrG7/ld+HKPE6Aw8bwWo+qMFdSa
 hEvvEzIu/zaJSb2BTYFtvaW/Hm7zKJ/l8mUsFcgCfo05pxdSWUr2u7mEzkzrEEtDetTk
 MDT8TyShlmDWInItpHB6KxX3glsvLA5rmbNhiN/JJmmAiZKtV7aPVdmI5gSrt7rAfamr
 jtcQ==
X-Gm-Message-State: AOJu0YwqVjy9kJjstKD6Qzbm/lvwDVzXlvvIOea5NufhN0thdR74UywB
 WTOku5+xV5X+JUe9jaJID0FcZ50Cv7fTMZSLb2DflvgPufchhpnjy4ArgJ6Pri4=
X-Gm-Gg: ASbGncsmcmrpMuwNKJ7vciTV+1UEezga8+P1DATN2sZm4w4gHw9b73eX1TvUp8SQ6Gp
 U8fHMUUUFUMG8shsmLIquXencU9L2V2EbxbbvQ4TBl2k5GyrNLniMfySiDTE5XBT/4yWNPGbFyZ
 6ZL8JHU45ACuohq2BA6DpvVobDbRW1uWQKpb3VlH5KQ3ywzwpERs+Hfoa3ukyBHbkixPGhWmoak
 x6oYNaD52y5Uy8QHUdJkvF/Cl5tXaUTUHzLJ8SqiBw4wblG9XiVtt0qo672L6PqoFkYbc0gVY8u
 0RZF353bhjy+L4oQSQc4+/daLjXJ+SsR1r6poUpZHpB5U0rI3hs40ODzYtsc9Sjl+bp8Cw6B0bo
 n6aDOQuVRag18hg==
X-Google-Smtp-Source: AGHT+IE5CsmfC7BODIIF7WjOxoo1NJOYEPJuZY0HD8RFjQUsjxB9qhvep5mzw8AwtcTsnm+FguM17g==
X-Received: by 2002:a05:6000:2a6:b0:39e:cc10:3945 with SMTP id
 ffacd0b85a97d-3a099ad2788mr1852261f8f.2.1746183597943; 
 Fri, 02 May 2025 03:59:57 -0700 (PDT)
Received: from meli-email.org (adsl-194.109.242.94.tellas.gr. [109.242.94.194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0c5esm1807099f8f.1.2025.05.02.03.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:59:57 -0700 (PDT)
Date: Fri, 02 May 2025 13:57:21 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Bcc: 
Subject: Re: [PATCH 2/9] rust: use std::ffi instead of std::os::raw
User-Agent: meli/0.8.12
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-3-pbonzini@redhat.com>
In-Reply-To: <20250502102323.104815-3-pbonzini@redhat.com>
Message-ID: <svmrvw.3kjuhwophzwbc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 May 2025 09:16:24 -0400
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
X-List-Received-Date: Fri, 02 May 2025 11:00:03 -0000

On Fri, 02 May 2025 13:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>This is allowed since Rust 1.64.0.
>
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> docs/devel/rust.rst                    | 2 --
> rust/hw/char/pl011/src/device_class.rs | 2 +-
> rust/hw/timer/hpet/src/hpet.rs         | 3 +--
> rust/qemu-api/src/chardev.rs           | 3 +--
> rust/qemu-api/src/irq.rs               | 6 +++++-
> rust/qemu-api/src/lib.rs               | 2 +-
> rust/qemu-api/src/memory.rs            | 3 +--
> rust/qemu-api/src/qdev.rs              | 3 +--
> rust/qemu-api/src/qom.rs               | 3 +--
> rust/qemu-api/src/timer.rs             | 2 +-
> rust/qemu-api/src/vmstate.rs           | 2 +-
> rust/qemu-api/tests/vmstate_tests.rs   | 7 ++++++-
> 12 files changed, 20 insertions(+), 18 deletions(-)
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

