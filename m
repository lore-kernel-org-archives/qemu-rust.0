Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6395CCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 14:13:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7Drd-0006h0-PL; Fri, 10 Oct 2025 10:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Drb-0006Zg-J1
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 10:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7DrX-0001x6-1N
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 10:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760105567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jmobBCoe5DPv0d1P0VrA8G7aTAUv3t7ChEuVERh6C/M=;
 b=OJ15WDOI2SJeV3CtWy32EZXJBgUxotEmuTPkvRGWt0FhXXkoYexKVgpMd2s6Qkmlzv5IIn
 3Pdadxmi/i5pecWybWM5nIeZv2SMew/wMFi3jZkz2sL0cNrcJqpQsuIscwhlIwXQElQqqr
 6GIYqjrQzeQIpSYhx+UFQheS/3zAaXc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-T74-dOMMPDeWb-mGKT_tPw-1; Fri, 10 Oct 2025 10:12:45 -0400
X-MC-Unique: T74-dOMMPDeWb-mGKT_tPw-1
X-Mimecast-MFC-AGG-ID: T74-dOMMPDeWb-mGKT_tPw_1760105564
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-639f0b76969so2836849a12.3
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 07:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760105564; x=1760710364;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jmobBCoe5DPv0d1P0VrA8G7aTAUv3t7ChEuVERh6C/M=;
 b=ARn/F9R0dJ+tGoZ+hXf5rdNWViOHsKQ4lla7l41FTxJ7IqZnIEKEDjvHbs7PI0fhLz
 R44fpggPnRs/yUf2EIK0RRouxCd6Oa6yCbOONX22ZK479zbDUx+DN0u3DfTQWqbdG/Dc
 TVNhuca24Tw2jVUfZZnuwe54LYgKU6IVJbMWnzDkCwdo80cWGfZriRXZ8f4a1tStIXqb
 AS8ZW2Shc3DkBHtTmzO/WWygN8nSMPyim6YfZMgd0XQjYJgIl2OImgg6I8BriE4/4+rN
 DBQwETix6SPWHE0gD6Kqa8jxcbYwbvqCE1hOyzcbcF3Jyf9WoDYB2cq2AKuxi3Js+Jya
 Ol4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0F4XIEoapfmOTg44TBYcBwDdLe9vHl1Tpr7y/IbRGAIVCSqAShnYEI5hP96wurgmIUdY8gKhlI8o=@nongnu.org
X-Gm-Message-State: AOJu0YwW0QzdGuZcyVTiDQSJSy5UwYZckNvMlF7HdYc88lBf9cZe/AMg
 WBa7uEug4wBTnFQvd9s52lkktoUPKq+3Rhpze34898p7g5TXaEvmz2/wtg+7gXsYAcbiOpEuYsT
 TgSntdVZrDh0SriN9Z7DoySVhiiCfRIxBVJh/wy1QYTE1lXfV6GYsrnKlLR848LU=
X-Gm-Gg: ASbGncuuyfu33GQqFu5FlPA5estGkY93AZcvgtqry17pSINpJB/3et2yYOju8OWkzOT
 LOwEMFDUKnIIO9zldK6UwTiEZ4u9C6Jwauqg9V8eHV1HNBX5oc0KNWcicI7XjSJyITmNcWoJ0kg
 5pKnVxGN3ZHvdk3VqpU0aNlsZ5pG84Y/nvB2Yf3xCZgcNl0akp4qkXRFkWBTxaMU0jlvAS0oSl/
 JrG5DMIvh1YMvqm+3haWZmg8GSR7X2VegCMxeW+shvVw+gwW8RR0NY31EFpm22BeGE3NNb9OSpE
 WpKBBL5B3NJUnNIuMK/Dc2Coq1U7SDW/3GsknwH2cZpkMBb1vIH/Asb1B8NF2eeD9y8JZAhujkT
 aTpnrBZTCcJPJ4MufEroc6NEIDeWv8lrt0aYTZWsjrDPg
X-Received: by 2002:a05:6402:1444:b0:63a:35c:6ebc with SMTP id
 4fb4d7f45d1cf-63a035c72c9mr5132039a12.23.1760105564152; 
 Fri, 10 Oct 2025 07:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjZmfNg5zqeX1Jsk5m2nObI4blvkeLDQ741khgs10wjUtM5J8kO+MSj6SZzFFHwyHJFxz0TQ==
X-Received: by 2002:a05:6402:1444:b0:63a:35c:6ebc with SMTP id
 4fb4d7f45d1cf-63a035c72c9mr5132006a12.23.1760105563661; 
 Fri, 10 Oct 2025 07:12:43 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.231.162])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b1e89csm2437553a12.19.2025.10.10.07.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 07:12:43 -0700 (PDT)
Message-ID: <0766dc6c-6cab-4f56-a8ab-c573aff15421@redhat.com>
Date: Fri, 10 Oct 2025 16:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: temporarily disable double_parens check
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20251009211208.643222-1-pbonzini@redhat.com>
 <CAAjaMXaPv+hENfLuZUeLEOjakuw7dOTLQCeaUbuveZW4Y_2PBQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAAjaMXaPv+hENfLuZUeLEOjakuw7dOTLQCeaUbuveZW4Y_2PBQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IVwnQR9oEYUKx7vk525kJucpl9BpCzUmtotvMqbnMzU_1760105564
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/10/25 14:23, Manos Pitsidianakis wrote:
> On Fri, Oct 10, 2025 at 12:12 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> It is showing in the output of the bits! macro and not easy to fix there
>> (at least not without making the macro more complex).  Disable it for
>> now.
>>
>> Link: https://github.com/rust-lang/rust-clippy/issues/15852
>> Reported-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
> 
> How about putting it in the macro expansion instead of globally allowing it?
> 
> macro_rules! foo {
>      ($a:expr, $b:expr, $c:expr, $d:expr) => {
>          #[allow(clippy::double_parens)]
>          InterruptMask(((($a.union($b).union($c).union($d))).into_bits()) as u32)
>      }
> }

Can you do it for procedural macros as well?

> Why is the double parenthesis needed here by the way? It's a method chain
It's just how the macro works, occasionally generating double 
parentheses keeps the parser simple.

Paolo


