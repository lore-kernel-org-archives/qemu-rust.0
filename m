Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6815DCCFA13
	for <qemu-rust@archiver.kernel.org>; Mon, 10 Nov 2025 13:56:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vISMg-0000PK-Gq; Mon, 10 Nov 2025 08:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vISHm-0003DL-9q
 for qemu-rust@nongnu.org; Mon, 10 Nov 2025 08:50:22 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vISHj-0006PQ-Hr
 for qemu-rust@nongnu.org; Mon, 10 Nov 2025 08:50:22 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so381373466b.2
 for <qemu-rust@nongnu.org>; Mon, 10 Nov 2025 05:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762782617; x=1763387417; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXCEtuBybIWNkH8OqUFYjuZlPwZp9AyCadxRNtAQ1Fk=;
 b=FdrH05DFq7RV2j5NXlZA46PVDmNILtkho/sWLPXeZNtU51roQPbcvywh1yp9dVcvfC
 2R4RVNljM8U5CdvUCyDw6FFwIeslcTMxWPshznpsPf2rH6VfBi5ZhccAsJ7HAdPyQHmH
 OPQXoPUX5okSmr3aasLHO4Tzy5ywKAmyvEVUPIARux2yjNKeLE0TPKcU5imRX3ainDvE
 CfKpyW8U+N3PsxkbyHUsAt0mb2q/Ih4bIJwCy2+fbkYsi7J/WlpOXyMBE7d1SPWMnKyN
 /N6+3dv3fhs+u8KzBfIPihxMVbTuBW2gi8Rv4Gy10BSLw18FwSSgTCJZSH2gYgJCm70v
 IdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762782617; x=1763387417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mXCEtuBybIWNkH8OqUFYjuZlPwZp9AyCadxRNtAQ1Fk=;
 b=dLnKksSXkhyfr2GZGHxZCIG+nSZPUAfAWWEB3EpQtJ0cikR7ovNSjQyoSz7Dwa6sef
 Kf78XfvlxX/8glDbhDShm3M8PbpXVnGvIMf92fvjgHIiBdAA380W3GJ7OeoRsGFiA3kJ
 54nUBPwGORaYWntJpOgRnd7ksFQrn23q7p/BLZV3wLYzjwmmCM+TFQfXoqZkFgIJlQjj
 37x+KpSzFNVPsEmKzONx0TRKcD1vtDnoinmJ3cjo0SGEM8qICJw865nLGrEUpJlbpC/v
 VgCPQqiKbPxHbKsXOdoSQVCV/Rbe+EBwqmuPde1erq1yKEItDUyh+ryJh067AFzkAdZR
 1Hog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWZU2EPOlc/s/kJQVOLkiFqa/56kdFw1Tf2Tv7zw1MqiflN5jQoKInNgOuJf+fcdy5goX/I4IIZRQ=@nongnu.org
X-Gm-Message-State: AOJu0YxFL11eXfdJcEVlQEUVFzEgzXUvS6lJckGxvmI2671MaLqXJGyI
 54ferd3mHRAvgxJudhu+6ywFC/sYqoPMxf8MWapqkojz3PbhDECltad50kkJ14EzJVJ7O38JNc8
 ikN5KmEe6EAIXmAJIhyozKnlRwayvrXcJxQSa6CUm8Q==
X-Gm-Gg: ASbGncuAjUbLWU1VJ7gzSEuUUDMcALOI6YlVgbRObu8fAMAuDGwjzebpgsaNeih40cy
 eb58OI++JFhvTEpBPtZvGCiR4+qJzoQsEJGvTigLfsQF6Hk777o9kaA5OI9NJ3+qF+l+f6CLlu8
 EJFXHxaimdt4mwdx84G2xxqlnGAaYD3Pwqdj1HN7sPGh6S0dm32pLD9H4c7u3mwJEhkcPDxespY
 ZyONiIL10gTrAuANuL+kFt5bKpga0BDhznQGo05hiLbyLYIhw1I1T6OXvAYKYFcrveA
X-Google-Smtp-Source: AGHT+IE/JOFksAxd4GP0WJpLJIQ0n3ZDNisPdGVey7S5iYT2Plwz8uGkMIsJzhC55C1yOSG2bl+48zbs1DI9K8nGifY=
X-Received: by 2002:a17:907:60d1:b0:b70:bc2e:a6f0 with SMTP id
 a640c23a62f3a-b72e02b3521mr716652666b.5.1762782617332; Mon, 10 Nov 2025
 05:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20251106215606.36598-1-stefanha@redhat.com>
 <20251106215606.36598-2-stefanha@redhat.com>
In-Reply-To: <20251106215606.36598-2-stefanha@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 10 Nov 2025 15:49:50 +0200
X-Gm-Features: AWmQ_bnZzqS7WMrJ7s44Zlwk6qf7OzRpa8-8ZzodONy_k1hmIh955cAMABSYzUw
Message-ID: <CAAjaMXaXgsHK2z-f81x_baUSZcaSsfRpBo1=s1TsgPeoPi3GSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hpet: remove unused trace events
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x632.google.com
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

On Sun, Nov 9, 2025 at 3:57=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/timer/trace-events | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index 2bb51f95ea..f3fca6fc9b 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -112,7 +112,6 @@ sh_timer_write(uint64_t offset, uint64_t value) "tmu0=
12_write 0x%" PRIx64 " 0x%0
>
>  # hpet.c
>  hpet_timer_id_out_of_range(uint8_t timer_id) "timer id out of range: 0x%=
" PRIx8
> -hpet_invalid_hpet_cfg(uint8_t reg_off) "invalid HPET_CFG + %u" PRIx8
>  hpet_ram_read(uint64_t addr) "enter hpet_ram_readl at 0x%" PRIx64
>  hpet_ram_read_reading_counter(uint8_t reg_off, uint64_t cur_tick) "readi=
ng counter + %" PRIu8 " =3D 0x%" PRIx64
>  hpet_ram_read_invalid(void) "invalid hpet_ram_readl"
> @@ -123,4 +122,3 @@ hpet_ram_write_tn_cmp(uint8_t reg_off) "hpet_ram_writ=
el HPET_TN_CMP + %" PRIu8
>  hpet_ram_write_invalid_tn_cmp(void) "invalid HPET_TN_CMP + 4 write"
>  hpet_ram_write_invalid(void) "invalid hpet_ram_writel"
>  hpet_ram_write_counter_write_while_enabled(void) "Writing counter while =
HPET enabled!"
> -hpet_ram_write_counter_written(uint8_t reg_off, uint64_t value, uint64_t=
 counter) "HPET counter + %" PRIu8 "written. crt =3D 0x%" PRIx64 " -> 0x%" =
PRIx64
> --
> 2.51.1
>

