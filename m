Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvdKc-000191-PT
	for mharc-qemu-rust@gnu.org; Fri, 21 Mar 2025 10:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvdKV-00017U-Gt
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 10:26:36 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvdKT-0002be-Pw
 for qemu-rust@nongnu.org; Fri, 21 Mar 2025 10:26:35 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-6ff1814102aso24565907b3.1
 for <qemu-rust@nongnu.org>; Fri, 21 Mar 2025 07:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742567192; x=1743171992; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EWojg+r5/UQDRAlld+v2Q3zypIFV3jNoUvRME6g8sFE=;
 b=WUV1Ce6Q5fsrQ0LvfyESHBrkMg7MbHIyrwYT8tFzc4xyYC4uZ7COtYSG1T0/1425Wt
 JZ2JTkxH9e3OB4QxRboIruMN6O42sNwL87o1KPUM1FPPNRwx1Dk+N9N9L0oISXpA3vmk
 Mw5Z3iRpYFZT/U1AYA9K4VGomKe3/UKBK0kXPSyMzrHNZCSyQ6SO6ZM3WIPPDfBkv8ox
 ExJ3bVSxgCU5N0HL54kSWI8CML1z+KB4qR74z+5QY2m89F222UVUP/E6JpFlINXr4WRi
 JvQfUiUcscpTwi+vefZDgGDbkDAOpcd2q+tBJohdCsrFdSJIX9z4xfVcbwRbcXEUhVuQ
 bTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742567192; x=1743171992;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EWojg+r5/UQDRAlld+v2Q3zypIFV3jNoUvRME6g8sFE=;
 b=YonbWZkqdkQZ/hqFMs2i3PsAE7DBw5Jw4jwN24wq04i59ZRbUcjpOLAonD+3ugQ1jw
 UfqUrDa7DmPokQ3xBJ6cZDJX2qdLraIrdHnjmp5/4AU9Q6jasoVLHEPKfYrfCJB8j2Z3
 AA5lYL+IxsaA7bqRz25a+01WLewIjSLIKQa1xStNmFCU9pibBi71tlwk2LgRyAAbCPAl
 6wDzx8lz7n3RGSmP8IF46oUjilVRvw/qgpS3+JJLoKXI76ubjxDnjcMNVyGa1bRkLKOv
 vl6ftMT25UYKXi6npmAftV0XxoFq1ZdfvLJdaqTjzDhUxixzI8TlwHH7i7eU2N43zjp3
 fsrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs/ySue2Hi+WT9CFK+SAck+Q8II1oWX/SsSrMP+skWZxovNrp3kJegvX9IOHs+TkS7qrdjOzF54Yg=@nongnu.org
X-Gm-Message-State: AOJu0YyFZ4BUxqwTvsue7OFQSsNai+TAuYTW+Y+FBxTC8kwkXnxoxKZ0
 DmAe6LTMCIm8R/VpdXccpShwl45VNG1/8JuVNtZZbbWXUDFGPHGkgtKmVW+b8/2Jj4i2OflJwbJ
 b/GdZYACXdWjJsPBnEc5sdp3A/KL2ywa6BhWhSQ==
X-Gm-Gg: ASbGncv5s8eg7kketw475s3keWRDLKF3yGqW+C/ZI6bpX0lEKo8+JGRoquuy3ROp7h8
 2PvuuNsMM1HQJxXVBPa4KC5nvbW/tsyXb1XcYrviE8EEiOAM2rMTAAz4nazpNWyNhfABSambIpq
 bpiQqQHOT6J5EaJysWmKpK+g+8Nmo=
X-Google-Smtp-Source: AGHT+IFNHf1utZe/MoKT6Y8goCeqROL6oxf8NWYDOZOlSo02DG0yo7ViAeU9Mwc8v18ht2YcOWmd53Jpdpf7FSe6/6c=
X-Received: by 2002:a05:6902:2808:b0:e58:36ad:a1ba with SMTP id
 3f1490d57ef6-e66a32a8dbemr4813151276.16.1742567191904; Fri, 21 Mar 2025
 07:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250321133339.116081-1-pbonzini@redhat.com>
In-Reply-To: <20250321133339.116081-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Mar 2025 14:26:19 +0000
X-Gm-Features: AQ5f1JoKU4GNsKrANCZl6HJ5aOfeS1z8HlaTG2DRFgBUhI40noZok5wKrTFKw0o
Message-ID: <CAFEAcA_h6VDA6E1=DHN5LyuekhmXcD8JpEUEjsHboPSDK-VdAg@mail.gmail.com>
Subject: Re: [PATCH] rust: hpet: fix decoding of timer registers
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-List-Received-Date: Fri, 21 Mar 2025 14:26:37 -0000

On Fri, 21 Mar 2025 at 13:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Due to a missing "& 0x18", timer registers are not decoded correctly.
> This breaks the tests/functional/test_x86_64_tuxrun.py functional
> test.
>
> Fixes: 519088b7cf6 ("rust: hpet: decode HPET registers into enums", 2025-03-06)
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/hw/timer/hpet/src/hpet.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
> index 63c1971f0b5..3ae3ec25f17 100644
> --- a/rust/hw/timer/hpet/src/hpet.rs
> +++ b/rust/hw/timer/hpet/src/hpet.rs
> @@ -776,7 +776,7 @@ fn decode(&self, mut addr: hwaddr, size: u32) -> HPETAddrDecode {
>              let timer_id: usize = ((addr - 0x100) / 0x20) as usize;
>              if timer_id <= self.num_timers.get() {
>                  // TODO: Add trace point - trace_hpet_ram_[read|write]_timer_id(timer_id)
> -                TimerRegister::try_from(addr)
> +                TimerRegister::try_from(addr & 0x18)
>                      .map(|reg| HPETRegister::Timer(&self.timers[timer_id], reg))
>              } else {
>                  // TODO: Add trace point -  trace_hpet_timer_id_out_of_range(timer_id)
> --

Tested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

If I understand the code correctly I think you could also
write this as "addr & 0x1f" which might be a little nicer
as it then lines up with the "/ 0x20".

thanks
-- PMM

