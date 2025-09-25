Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C2DCAC5A7
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 09:57:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1iiz-0006Y8-So; Thu, 25 Sep 2025 05:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1iiw-0006X6-JD
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 05:57:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1iii-0004Ew-Jn
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 05:57:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46cb53c5900so8396065e9.3
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758794214; x=1759399014; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b3zkmtwgF8OgRZSVxNZsJWGz7kIKA/pWysAG8vggoYU=;
 b=LAhPtzAq8dUdDD6m/kNijIOXFxVyAaqo7Zovy38OFA39PfLggN0UNIEuBxG5R0/MHD
 /zPp4ihYXK2L53ZZp86GEnre5F6kNZGtGdjJ8qWWsJ5E1bFfNhpg9h0iLWobiYOie/oT
 YhiS/oNosd/tqkg59dn15FQU5Hm8uYlXyKe2uQ9oIaUls1QjG3cVZbsADyt0Q9EjjKkw
 UtAnhtYVQHPGqpJ6OXpYm84shQEY+Kj0Y6A66iR81do9SHxwd+agRygjZTFKg3xNH8LY
 07xgDeGevtQ66qyltIcrDfoXHzzhiMLXFawRb0W7SL3LPn/5kY5op5o0cEz7+yQdhHCt
 DwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758794214; x=1759399014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b3zkmtwgF8OgRZSVxNZsJWGz7kIKA/pWysAG8vggoYU=;
 b=KUNLeSxEUCoM4mp3KyBg2+4AjY41ThBG9cMkxQLVh5RgBPfw13dI2tjgScv88/bKIW
 N8Ji0Y+JZWbhlbwdvQcd9jcDD9HmAGLKg54orGvpZnNz2XB5PChkbDhpuG8Gcaf3njuP
 k/xNiDoZXJk3e1fSx2MRHrmZDnGwQD8LGvqtDFNtBfzNLvH+5bQn1pMKUMO+P1h602hD
 oy4FaqTjVwhv82AJyjXAsLTl0MWHVxWWF1gksgGZIOFBVl4Xeh07J0Kn2kmwdUWHggXK
 qA+AacnfsUyO+nY/5hIMf8Y2GReZKMnrdvap2yd7xrM8KisNa42H/Pz2atfHDU0Q+RVj
 eTBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Nyam/Y93QJ48qURFAzFcJjdzGatD07UwFDo/ilYSaXXzYyCkJpyr/xN2hddcyB61o5Era4oyD2Y=@nongnu.org
X-Gm-Message-State: AOJu0YzUCJGbha1G5Qfr5nCFOGhq91uqFFa0u5jHTur5vXzg2Ga7zLBr
 ejmv9u+Pfv9NczdGa7Zm3QBlRp0mJkF7wTSWGEvyczCPtQmdRZ/KNXWtKLMYqDCfrs4=
X-Gm-Gg: ASbGncuglbdbG0IHBZa39zOoLYV3Xhh88pE3s4gQLFjmokm6Hz8QinMVGTOtPYwv2xs
 lQm539KkwjwdL4QMhJ9iifEHOHev725+S/sge+8eBM2brvI3urZRg34YbIwDM0eBpsKisK7smfi
 SGsiKuh+5vz6NlLCaP9laTnCtUpw9ZfUwmDx9D8fNoW3GbwD3FePnP/wMp6d2u4Zj/zWSRnCQW+
 EHUQ0ggyKaoJCNyFP3eC/5oSy2T7+9erjxCqft87PTuiZ9JctWI2s6s5soHBUVrqgD/wbpeZ1JI
 wGN6jxTyHC851ziqW+E6hy54k+Mmqen/wBSzrsJcaRddBh/4XJ0G6fM4Wg+o+2bfv/9MShNNsfg
 9MUQJdgcqzahoUzhAnPaX8EKbP4yyyeYlA516Awk/9PlSBOyHiVAJhduGi2i86jA3f14IM2elJE
 39
X-Google-Smtp-Source: AGHT+IFQXlM3WaBbfz+dZa4JeP/4nB5z9+k7VxWSLirBZVaOSSh+6DrF6u4nQuNn52vn3qx3Jptx8w==
X-Received: by 2002:a05:600c:8b33:b0:46e:1fc2:f9ba with SMTP id
 5b1f17b1804b1-46e32a0d5e7mr32845575e9.25.1758794213831; 
 Thu, 25 Sep 2025 02:56:53 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac5basm83309395e9.7.2025.09.25.02.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:56:53 -0700 (PDT)
Message-ID: <d451bfcb-0764-4dd4-bfa8-57eb2e1ead81@linaro.org>
Date: Thu, 25 Sep 2025 11:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/23] util: fix interleaving of error prefixes
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-rust@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, devel@lists.libvirt.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250925094441.1651372-1-berrange@redhat.com>
 <20250925094441.1651372-18-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925094441.1651372-18-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 25/9/25 11:44, Daniel P. Berrangé wrote:
> The vreport() function will optionally emit an prefix for error
> messages which is output to stderr incrementally. In the event
> that two vreport() calls execute concurrently, there is a risk
> that the prefix output will interleave. To address this it is
> required to take a lock on 'stderr' when outputting errors.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/error-report.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


