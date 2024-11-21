Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEEIc-0006SL-1B
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 16:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tECnQ-0003NP-FC
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 14:24:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tECnN-0003NE-5j
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 14:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732217092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oHhzRY1DDx5AtEjcDs/FlVKKpG2XZi+o+W+4cGdMJKU=;
 b=GUMEJ95293t+Gz2YVuKYBZaFLjAJF+EicnEblEjrL0bjwC+XdNeMN2U//YB4+25VDWsDGt
 ucWXdnIVcSG1IiVyRluxUqdrxOskvCXzdT9czwr31Ge0BBw0rkMYgoviXbf1oBrIS4zQLu
 1wJgGW+tFg2F3kDLguU6EQmTM84WmfY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-kps8mFeFPwCRzFF6MHAxrg-1; Thu, 21 Nov 2024 14:24:51 -0500
X-MC-Unique: kps8mFeFPwCRzFF6MHAxrg-1
X-Mimecast-MFC-AGG-ID: kps8mFeFPwCRzFF6MHAxrg
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5cfdcbd3a03so1033680a12.2
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 11:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732217090; x=1732821890;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oHhzRY1DDx5AtEjcDs/FlVKKpG2XZi+o+W+4cGdMJKU=;
 b=u8noTZ1zH3WYOt2AQbhvY/uKEoyJUlvIMwU9zfbCcj8dIJCcTce+mgg4ebuzn3DUvC
 RPuKw0LRF9CCZBaa3tMnE80VkGAEyaaMgSEjIfy4ik0mGKTG5IkoJak727WVCpc+V5l/
 l+N6VBOHbTl7Pgqwr7G9+MXlwvtzi82Ps0bAzNUXZ0sxMB0XDI4raGBIGnDWG904z0v4
 sN8UVLSuDgvsPq5tKbFs9fy8EZqskNClXttLhNavyVXaGx1QCvAKW+6++jjZffiZf3i7
 GwvdF3dVE40JebxAQ8jELQnwBbr+fCYzvtFa6WlBkxLGoxZ1VxRC7TbUR0bRy+jpFcsK
 FSoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGGEwOAQVUMFp2e54rqI90rYyiz8umqdNfc1Mi5xpwbHJuvObUvewyJTrCNnwZyXm9uXfp04WNtR0=@nongnu.org
X-Gm-Message-State: AOJu0YxnJRwQ0C7A6nU9H4ckde7cxN+m3e4cuwfUKoX/9gyGU+JpUWB/
 MRbOTPeCwAgd2WRaWHynwPHuunWgtyrVlyRzMbYIV7TlqjWFdLoLltnn6ylD144kJ6622RgfmlB
 fYHM8nrTRY2HNTRCR85nzjgV2w8kcMvJZVIhTliHKIiwNE+O/JYI=
X-Gm-Gg: ASbGncv7zVYUJclDdUT7nDMIqL1f0ckURbzzRZ1rAf7IL3ERFZXmNOHhktSsMfjj6zs
 LmHTsjqo8wmq1it8/ytYcCWP/LJTFnUc96mfbA8I+fztuHykB+rP5jIp2WsEwNzHA5ZEYZez1qh
 dWuE1ueIV+82s0ZCbZVgaC0HeKcaqotwPq9AttQFYDaUpVTuuF8EaPUakQBe029S2V8XgJn2jlN
 cK7V0VmzTlVa80/2CW1sbOMEcvBWzw0d+mFQ0iMcPizY0QdMnqkQW7Uiwn3zc8vhBV72YFnsPEt
 9OA=
X-Received: by 2002:a05:6402:5ca:b0:5ce:bb32:ccac with SMTP id
 4fb4d7f45d1cf-5cff4cb5887mr5496195a12.26.1732217090108; 
 Thu, 21 Nov 2024 11:24:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESte4FUUfXXG7nMs7+ESJc+k/ADg8VAPZqc4NMHb94P0GLerMCGtDZ14/y2TBClpJqDe6J0Q==
X-Received: by 2002:a05:6402:5ca:b0:5ce:bb32:ccac with SMTP id
 4fb4d7f45d1cf-5cff4cb5887mr5496156a12.26.1732217089768; 
 Thu, 21 Nov 2024 11:24:49 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d401f64sm96925a12.70.2024.11.21.11.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 11:24:48 -0800 (PST)
Message-ID: <bfb12b04-ca4b-4135-ba09-250daffb9ea9@redhat.com>
Date: Thu, 21 Nov 2024 20:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/39] tests/functional: require non-NULL success_message
 for console wait
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-15-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-15-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 665KSCHG0VsM6HChbRN15Bk94vjYMcXrLOh3UcKhVNI_1732217090
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Nov 2024 16:01:12 -0500
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
X-List-Received-Date: Thu, 21 Nov 2024 19:24:58 -0000

On 21/11/2024 17.57, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> When waiting for expected output, the 'success_message' is a mandatory
> parameter, with 'failure_message' defaulting to None.
> 
> The code has logic which indicates it was trying to cope with
> 'success_message' being None and 'failure_message' being non-None but
> it does not appear able to actually do anything useful. The check for
> 'success_message is None' will break out of the loop before any check
> for 'failure_message' has been performed.
> 
> IOW, for practcal purposes 'success_message' must be non-None unless
> 'send_string' is set. Assert this expectation and simplify the loop
> logic.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20241121154218.1423005-15-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/qemu_test/cmd.py | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
> index 98722a9cf6..f6c4e4dda1 100644
> --- a/tests/functional/qemu_test/cmd.py
> +++ b/tests/functional/qemu_test/cmd.py
> @@ -81,6 +81,8 @@ def is_readable_executable_file(path):
>   def _console_interaction(test, success_message, failure_message,
>                            send_string, keep_sending=False, vm=None):
>       assert not keep_sending or send_string
> +    assert success_message or send_string
> +
>       if vm is None:
>           vm = test.vm
>       console = vm.console_file
> @@ -95,7 +97,7 @@ def _console_interaction(test, success_message, failure_message,
>                   send_string = None # send only once
>   
>           # Only consume console output if waiting for something
> -        if success_message is None and failure_message is None:
> +        if success_message is None:
>               if send_string is None:
>                   break
>               continue
> @@ -107,7 +109,7 @@ def _console_interaction(test, success_message, failure_message,
>           if not msg:
>               continue
>           console_logger.debug(msg)
> -        if success_message is None or success_message in msg:
> +        if success_message in msg:
>               break
>           if failure_message and failure_message in msg:
>               console.close()
> @@ -138,6 +140,7 @@ def interrupt_interactive_console_until_pattern(test, success_message,
>       :param interrupt_string: a string to send to the console before trying
>                                to read a new line
>       """
> +    assert success_message
>       _console_interaction(test, success_message, failure_message,
>                            interrupt_string, True)
>   
> @@ -152,6 +155,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
>       :param success_message: if this message appears, test succeeds
>       :param failure_message: if this message appears, test fails
>       """
> +    assert success_message
>       _console_interaction(test, success_message, failure_message, None, vm=vm)

This assert is theoretically not needed since we call _console_interaction 
with send_string=None, so if success_message is None, the new assert in 
_console_interaction would trigger instead.

But it also does not hurt to have it here, so fine for me if we keep it.

Reviewed-by: Thomas Huth <thuth@redhat.com>


