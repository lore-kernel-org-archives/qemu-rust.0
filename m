Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672DCC87FCA
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 12:42:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ujzwN-0003gy-7d; Thu, 07 Aug 2025 08:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujzwL-0003di-5D
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 08:41:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujzwI-000302-3b
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 08:41:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so1793165a12.2
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754570504; x=1755175304; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uvdal751jqyRTot/pDvPZqEYDMdRfnZS0zQnhiX+4XU=;
 b=aRu2tqDc3wPs6BUTcucQ88uGAt8SUSL4Q7MERg4hwJj8IAQeM1rmjoJf160BdgrxK8
 zWuSUFDq3Q2KKrwP25AGOUZjuebRr+n7hdzM81ifJ3cv2cA0vGVyP+rgSFUwfm5jNt6P
 LKfb1BXfFklVoMa1TRKFVN/O+LP0OL/6G74poXCfuZmeJOHi+YMAxTZ/FY/u3DrbZu6L
 gw6RhLW4zO39sTi16xOeUAhlShtEPmBZ8XyNVO/5Jyx5J50vltmKG+ZByPkyqLnByDK8
 +yDRpdfiamgS00TUmlEGpL9aMDFDb51kYDcAdNWoPRJsI3ZL7Uq/urlKtIbZJlt1N8DP
 /3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754570504; x=1755175304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uvdal751jqyRTot/pDvPZqEYDMdRfnZS0zQnhiX+4XU=;
 b=ru2wCXAwMTtLLg79CImjYmSdFHQ6YsPfoKxphU/mxA1PI+bVG8Wyg7oh/r2uHGtVFI
 e9Qki8LEy7Lh1ZB8nYmc4SHysKOK1EyBeU582HhMFkgj75lzGluUMqWtc8OT7RhrZ3D9
 r401vmCzCM41v4WmBvLPZ1q1a6AotEmA4aRhm0DWdYE45zqq72nwm4d6tFKFXUMv8n6M
 yuidnE4EF8YF6/3ZaSycIo/sBKeCJqNoy0XbGV2XIlswLoNfxmvFPpOSLqHxFxVV0QwL
 jD75koU59QIol/lH5BD7mgc7KAOOM8vpwJfpWKgvzkTCWzIsmq2GdAH4FHILG3cHdaA0
 Erfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc0eFU/L9M13f+dj23YAiDueWSgywkYsyaYcF50TEsIXpU0Uk7q6mFq7nkCrgLt2T6/eymyFM0bRM=@nongnu.org
X-Gm-Message-State: AOJu0YxOtkL5AaXD7pi/WXfY+ToONJpBU+Nr73td68z4u7UBMl8Y8SIX
 83kyyxiFbdQKMjB4lk5EJpa4IDk6O4J937gCutb7JbXtXZ7zfMCsN8ov3ANbcftOz+ukggQbf/L
 fYO2TkWGgli3BsJS+A4lG6PDn+Vhdq1RtiUyR/VIsYw==
X-Gm-Gg: ASbGncvjH0dqkJf3csqZ99uKgMcSFVEn+ZgLc1P1nqAeldO8AvMIn6tRFGnvGAvIJwM
 fGg4N+ny6QjJvy5CITPCQTOap5CsZUK9eC4WRhJriWJuRXv56n62nyFB1xSOkgZ6u0hslI6Y9zj
 3Ez+7DW+v1UBfFW3e/lP1edUoe7yrOexw50/BHu64a5WkceIa3NnxqzutTUxTgFJq+GJJvT0sb/
 nB2flBQ
X-Google-Smtp-Source: AGHT+IG1IJW+DwzcfbmsruHztxRdT0K2AGQNODwg69IQGcsp6u86KWZI/0XX7A0voTeyO22HcorXVdUxMHhwI/TBVKg=
X-Received: by 2002:a05:6402:2355:b0:617:cd9d:e26a with SMTP id
 4fb4d7f45d1cf-617cd9de772mr819235a12.6.1754570503923; Thu, 07 Aug 2025
 05:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-19-zhao1.liu@intel.com>
In-Reply-To: <20250807123027.2910950-19-zhao1.liu@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 7 Aug 2025 15:41:17 +0300
X-Gm-Features: Ac12FXyxJB611_11oQwNY6s66qm8p492d7Z8RoVCHMRP2EcUEchUPvIoXXqDUlw
Message-ID: <CAAjaMXaNVFinLS3eRcBw+-R21XnHWDx5ACWQDhnS-ndseDBhJw@mail.gmail.com>
Subject: Re: [RFC 18/26] memory: Rename flatview_access_allowed() to
 memory_region_access_allowed()
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>,
 qemu-devel@nongnu.org, 
 qemu-rust@nongnu.org, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
 Chuanxiao Dong <chuanxiao.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52e.google.com
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

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

On Thu, Aug 7, 2025 at 3:10=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrote=
:
>
> flatview_access_allowed() accepts `MemoryRegion *mr` as an argument, so
> it's based on MemoryRegion and should be named as
> memory_region_access_allowed().
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  system/physmem.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/system/physmem.c b/system/physmem.c
> index d2106d0ffa87..8aaaab4d3a74 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2921,7 +2921,7 @@ bool prepare_mmio_access(MemoryRegion *mr)
>  }
>
>  /**
> - * flatview_access_allowed
> + * memory_region_access_allowed
>   * @mr: #MemoryRegion to be accessed
>   * @attrs: memory transaction attributes
>   * @addr: address within that memory region
> @@ -2931,8 +2931,8 @@ bool prepare_mmio_access(MemoryRegion *mr)
>   *
>   * Returns: true if transaction is allowed, false if denied.
>   */
> -static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
> -                                    hwaddr addr, hwaddr len)
> +static bool memory_region_access_allowed(MemoryRegion *mr, MemTxAttrs at=
trs,
> +                                         hwaddr addr, hwaddr len)
>  {
>      if (likely(!attrs.memory)) {
>          return true;
> @@ -2952,7 +2952,7 @@ static MemTxResult flatview_write_continue_step(Mem=
TxAttrs attrs,
>                                                  hwaddr len, hwaddr mr_ad=
dr,
>                                                  hwaddr *l, MemoryRegion =
*mr)
>  {
> -    if (!flatview_access_allowed(mr, attrs, mr_addr, *l)) {
> +    if (!memory_region_access_allowed(mr, attrs, mr_addr, *l)) {
>          return MEMTX_ACCESS_ERROR;
>      }
>
> @@ -3036,7 +3036,7 @@ static MemTxResult flatview_write(FlatView *fv, hwa=
ddr addr, MemTxAttrs attrs,
>
>      l =3D len;
>      mr =3D flatview_translate(fv, addr, &mr_addr, &l, true, attrs);
> -    if (!flatview_access_allowed(mr, attrs, addr, len)) {
> +    if (!memory_region_access_allowed(mr, attrs, addr, len)) {
>          return MEMTX_ACCESS_ERROR;
>      }
>      return flatview_write_continue(fv, addr, attrs, buf, len,
> @@ -3048,7 +3048,7 @@ static MemTxResult flatview_read_continue_step(MemT=
xAttrs attrs, uint8_t *buf,
>                                                 hwaddr *l,
>                                                 MemoryRegion *mr)
>  {
> -    if (!flatview_access_allowed(mr, attrs, mr_addr, *l)) {
> +    if (!memory_region_access_allowed(mr, attrs, mr_addr, *l)) {
>          return MEMTX_ACCESS_ERROR;
>      }
>
> @@ -3127,7 +3127,7 @@ static MemTxResult flatview_read(FlatView *fv, hwad=
dr addr,
>
>      l =3D len;
>      mr =3D flatview_translate(fv, addr, &mr_addr, &l, false, attrs);
> -    if (!flatview_access_allowed(mr, attrs, addr, len)) {
> +    if (!memory_region_access_allowed(mr, attrs, addr, len)) {
>          return MEMTX_ACCESS_ERROR;
>      }
>      return flatview_read_continue(fv, addr, attrs, buf, len,
> --
> 2.34.1
>

