Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA44CD4F5E
	for <qemu-rust@archiver.kernel.org>; Thu, 21 May 2026 08:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wPyXh-0006Pu-Qn; Thu, 21 May 2026 04:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wPyXh-0006Pg-1D
 for qemu-rust@nongnu.org; Thu, 21 May 2026 04:14:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wPyXe-0002K1-NA
 for qemu-rust@nongnu.org; Thu, 21 May 2026 04:14:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45297094718so4587567f8f.3
 for <qemu-rust@nongnu.org>; Thu, 21 May 2026 01:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779351245; cv=none;
 d=google.com; s=arc-20240605;
 b=SjPriTWbd86DsTMoJT/6AHTqREPqukSD/4KIytLdJjEkzDM3QVqJbEfh1jevjkrF3J
 L/pDgmqwAWYh6272iR3Mzea/kNgi634OWzaOei1j4wcIoh5ICHYFmQTkprg+ipGF3J+e
 DCxEfIplx8jWyZRQPib2jYPx8INIJIe8OI3n+o0EClYNgDBG11qAyK/jVROmu/lX+0AE
 y2nLvbbxLn46Et84Pf0kFOQZiX78ucz5ljE7gcrZp7UIUbCRQwYVwOsYX0rpuSKUIwcn
 FZD9+nv4u6f2xHmzfXJHMqaVVjr2XzCv3YCMQWvKCBrVuwqr/Xnpic7RaxiaVoqQA09R
 LUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=p/TCRy35TvWV/lCDHNFSokU/PgzHXtZrUZsZ7z0Wzt0=;
 fh=EXebznnlH/FImyLZ/7PvffFudHfuEshQcG3Grgqot+g=;
 b=g8OoqGVBUgeN6zSXvvto55wJqVpoWHJa3Vd3Sf7tCk1JtqVebmmlW3djgY095fsB5U
 Ed0XyNn+Gaac5AFieNJ4u12QTKSj57Me/uGrZLnynolwdz7ReOcSrnobM4Y0kbcdO94B
 o5cGkKjnsNv4pIQb/s7am2LsFxOXJOv1xDRGRIoudlRMVQ11HHezT3PHpWGbgcsFcW33
 H51cd7njNilv85tA1v05GXVzr5sy/ihuOX/uHzBYy6BLnseYJMJHnb40iT38gwC12/bB
 c+LA6xEm4op6mT5DOsv/rPDwM3zE2uhKUgiQ5qiiiU/4ATeGyuM2Jvwdb5KGvHYrsaFC
 x+2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779351245; x=1779956045; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/TCRy35TvWV/lCDHNFSokU/PgzHXtZrUZsZ7z0Wzt0=;
 b=sGNPq/lI/iTYWm16cQOd9BafJNUQdOK3S64mFJ6zgWx64YbuNx2aBdDG3otbOzF4CQ
 YVJVCTQLbRLPeDeL39lfqYbH65jyZcmIpPDftEgScsN85lE6lRGv9x/1ZIjOwctXFI9z
 NAjnptyMwxx3Xadt0iiD6fXm84SnNP2XRyYHHreH9p+gEQETZn5wZ+Ff0P7Ln4vWj2V0
 4IpU1HoFI02xlX5akVLhOUzzAX6Ej5M2U5cFdD/iJo7IPLCFQWbvIZYQFCnJTZX1/eWx
 yKNuBtPL/b7yEeRZ9i6RjqwBEx90Qz1AhLX8zJmBmMfqaVThI64QB1AhtbSPuQEijYql
 3VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779351245; x=1779956045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p/TCRy35TvWV/lCDHNFSokU/PgzHXtZrUZsZ7z0Wzt0=;
 b=XlqcpM2j157HTavxOJWZOpRpLqG7OjLaDbqdhHQnkd7OBHcdYgciSdm+lUBtmpPNvi
 4PhRcdt3ZaGCAhdWz9ue47Utp5R63Vlw1/5XPp/ovIL8uycxn35SR4YrPRhZhrOcAmUz
 SPNdwTUSlq7+WEMJducQfyCyfHVeXTSvFvFXp4E1f+//uzEhkPaCB2cY//l4pMb202Rx
 O//VSyfPo1DJhDCwGN48pCuhra9P3niABLRt3cYxAURcUxvhjJ7aqxh4SbVc3pjcXWKa
 xSBebyWTpyw5zAcBdx50VtvxE5LfecA5J0iLwtqp0ynFggCg6X652TywgOoJuOGScxV6
 p5YQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ciUSD3Bwb3s16GL/97e5RHLMwZdNc54dAWeWDQ/jgKDobYQssEPjKLSTE5Iar9QlB95xwsfDAGp0=@nongnu.org
X-Gm-Message-State: AOJu0YzHKazVmdl+GRIISqOktBAaZ94npBo76FgsxWaHgyCUJxCiC8vT
 v2MZvxQBv90psCkG34Fh0VQWGbfZ7zerUasbKnrXVODnKzyUpaAgXL2mQ48oy0sKvEA2c70b05j
 b3/55eM0w1BOy8NHTgUYr74IUDjyw0Wg31L+AgaCBiA==
X-Gm-Gg: Acq92OE3U5V2S7VvEetVt81gY8csZIJuHEgrmiUqmELe9X+VVkBmfqodpJYbj9OCM3x
 HUwLzeJw3unAEN2bKwqSSpoOA1RnAzZZWYLXztUrEt2DfSuxjoBwZmsB/fGKvs0t3ZtTMRR109s
 TILCsk+PWQYXFo7LEGntxwAJ2r/+OSQcR4kDCJs9hVtBqSrA4w6L0E0abHHl51h8V1PQTaYC/fT
 U8IeJgHs0i5qlX/sYXmaZiWb4K/vPmhFFTUqNZiVB/VBsAmjGM/ooQTZUTekPKGr0Sb9siHPIji
 RbkNGa+tZzYkjXvjjqtUi+C+bsRUoq8ZMZsKwEh15es/Q18IlQ==
X-Received: by 2002:a5d:6f14:0:b0:43d:69ff:6898 with SMTP id
 ffacd0b85a97d-45ea35aeacamr2638259f8f.9.1779351244627; Thu, 21 May 2026
 01:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260521080511.999266-1-armbru@redhat.com>
 <20260521080511.999266-40-armbru@redhat.com>
In-Reply-To: <20260521080511.999266-40-armbru@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 21 May 2026 11:13:38 +0300
X-Gm-Features: AVHnY4J2Bm7-2MflEQ0xRHmd-fEzE6g3jrUg-ZCUqMUo8kObE3bGZvXIYAJ_MfI
Message-ID: <CAAjaMXZsUD7Dbe6Jbte=avD4-1o3vrt6Q4GFbTSULO-S4wRPyw@mail.gmail.com>
Subject: Re: [PATCH 39/39] MAINTAINERS: Fix F: in "Rust build system
 integration"
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, 
 pierrick.bouvier@oss.qualcomm.com, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42e.google.com
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

On Thu, May 21, 2026 at 11:05=E2=80=AFAM Markus Armbruster <armbru@redhat.c=
om> wrote:
>
> We neglected to update MAINTAINERS when we moved rust/wrapper.h, and
> again when we split it up.  Update it now.
>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: qemu-rust@nongnu.org
> Fixes: 1ae4ca0463 (rust: move rust.bindgen to qemu-api crate, 2025-06-13)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Thanks,

>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b7fe4fa58a..37bc1bab06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4629,7 +4629,7 @@ F: scripts/rust/
>  F: rust/.gitignore
>  F: rust/Kconfig
>  F: rust/meson.build
> -F: rust/wrapper.h
> +F: rust/bindings/*/wrapper.h
>
>  Miscellaneous
>  -------------
> --
> 2.54.0
>

